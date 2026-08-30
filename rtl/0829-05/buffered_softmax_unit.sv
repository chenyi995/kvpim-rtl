// Buffered (not online) FP32 softmax: 8 scores/chunk, MAX_L <= 512.
// The score and exp buffers are independent 16 KiB SRAMs.  Arithmetic
// transactions are deliberately serialized at the chunk level so every SRAM
// address/mask stays aligned with the fixed-latency FP32 leaf pipelines.
module fp32_sum16 (
 input logic clk,input logic rst_n,input logic in_valid,input logic [15:0][31:0] a,
 output logic [31:0] y,output logic out_valid);
 logic [7:0][31:0] s1; logic [3:0][31:0] s2; logic [1:0][31:0] s3; logic [7:0] v1; logic [3:0] v2; logic [1:0] v3;
 generate for(genvar i=0;i<8;i++) fp32_add u1(.clk,.rst_n,.in_valid,.a(a[2*i]),.b(a[2*i+1]),.y(s1[i]),.out_valid(v1[i]));
 for(genvar i=0;i<4;i++) fp32_add u2(.clk,.rst_n,.in_valid(v1[2*i]),.a(s1[2*i]),.b(s1[2*i+1]),.y(s2[i]),.out_valid(v2[i])); endgenerate
 generate for(genvar i=0;i<2;i++) fp32_add u3(.clk,.rst_n,.in_valid(v2[2*i]),.a(s2[2*i]),.b(s2[2*i+1]),.y(s3[i]),.out_valid(v3[i])); endgenerate
 fp32_add u4(.clk,.rst_n,.in_valid(v3[0]),.a(s3[0]),.b(s3[1]),.y,.out_valid);
endmodule

// Four registered levels of a 16-input FP32 max tree.  This replaces the
// previous 16-element combinational scan on the MAX_PASS critical path.
module fp32_max16_pipe (
 input logic clk,input logic rst_n,input logic in_valid,
 input logic [15:0][31:0] a,input logic [15:0] keep,
 output logic [31:0] y,output logic out_valid
);
 localparam logic [31:0] NEG_INF=32'hff80_0000;
 logic [7:0][31:0] l1; logic [3:0][31:0] l2; logic [1:0][31:0] l3;
 logic v1,v2,v3;
 function automatic logic gt(input logic [31:0] x,input logic [31:0] z);
   logic sx,sz; logic [30:0] mx,mz;
   begin sx=x[31];sz=z[31];mx=x[30:0];mz=z[30:0];
     if(sx!=sz) gt=((mx!=0||mz!=0)&&!sx); else if(!sx) gt=(mx>mz); else gt=(mx<mz);
   end
 endfunction
 function automatic logic [31:0] max2(input logic [31:0] x,input logic [31:0] z);
   begin max2=gt(x,z)?x:z; end
 endfunction
 always_ff @(posedge clk or negedge rst_n) begin
   if(!rst_n) begin l1<='0;l2<='0;l3<='0;y<=NEG_INF;v1<=0;v2<=0;v3<=0;out_valid<=0; end
   else begin
     v1<=in_valid; v2<=v1; v3<=v2; out_valid<=v3;
     if(in_valid) for(int i=0;i<8;i++)
       l1[i] <= max2(keep[2*i] ? a[2*i] : NEG_INF, keep[2*i+1] ? a[2*i+1] : NEG_INF);
     if(v1) for(int i=0;i<4;i++) l2[i] <= max2(l1[2*i],l1[2*i+1]);
     if(v2) for(int i=0;i<2;i++) l3[i] <= max2(l2[2*i],l2[2*i+1]);
     if(v3) y<=max2(l3[0],l3[1]);
   end
 end
endmodule

module buffered_softmax_unit #(
 parameter integer MAX_L=4096, parameter integer ADDR_W=(MAX_L<=16)?1:$clog2((MAX_L+15)/16)
) (
 input logic clk,input logic rst_n,
 input logic in_valid,output logic in_ready,input logic [15:0][31:0] in_data,
 input logic [31:0] seq_len,
 output logic out_valid,input logic out_ready,output logic [15:0][31:0] out_data,
 output logic [15:0] out_keep,output logic out_last,output logic done
);
 localparam logic [31:0] NEG_INF=32'hff80_0000;
 typedef enum logic [4:0] {IDLE,FILL,MAX_REQ,MAX_WAIT,MAX_REDUCE_WAIT,EXP_REQ,EXP_WAIT_RD,
   EXP_SUB,EXP_WAIT,EXP_WRITE,EXP_WAIT_SUM,EXP_WAIT_ACC,EXP_DRAIN,
   RECIP_ISSUE,RECIP_WAIT,NORM_REQ,NORM_WAIT_RD,NORM_MUL,NORM_WAIT,NORM_SEND,DONE} st_t;
 st_t st;
 logic [31:0] len_q,running_max,running_sum,inv_sum,local_max;
 logic [ADDR_W:0] chunks; logic [ADDR_W-1:0] fill_addr,max_addr,exp_addr,norm_addr;
 logic [15:0] cur_keep; logic [15:0][31:0] exp_src,norm_src;
 logic score_en,score_we,exp_en,exp_we,score_rvalid,exp_rvalid;
 logic [7:0] score_addr,exp_buf_addr; logic [511:0] score_wdata,score_rdata,exp_wdata,exp_rdata;
 logic sub_v,exp_v,sum_v,acc_v,recip_v,mul_v,local_max_v;
 logic [15:0][31:0] sub_y,exp_y,mul_y; logic [31:0] sum_y,acc_y,recip_y;
 logic [15:0] out_keep_r; logic [15:0][31:0] out_data_r; logic out_last_r,out_v;
 function automatic logic gt(input logic [31:0] a,input logic [31:0] b);
   logic sa,sb; logic [30:0] ma,mb;
   begin sa=a[31];sb=b[31];ma=a[30:0];mb=b[30:0]; if(sa!=sb) gt=((ma!=0||mb!=0)&&!sa); else if(!sa) gt=(ma>mb); else gt=(ma<mb); end
 endfunction
 function automatic [15:0] keep_for(input logic [31:0] n,input logic [ADDR_W-1:0] ai);
   logic [31:0] rem; begin rem=n-(ai*16); for(int i=0;i<16;i++) keep_for[i]=(rem>i); end
 endfunction
 always_comb begin
   score_en=0;score_we=0;score_addr='0;score_wdata='0;exp_en=0;exp_we=0;exp_buf_addr='0;exp_wdata='0;
   if((st==IDLE||st==FILL)&&in_valid&&in_ready) begin score_en=1;score_we=1;score_addr=fill_addr;score_wdata=in_data; end
   if(st==MAX_REQ) begin score_en=1;score_addr=max_addr; end
   if(st==EXP_REQ) begin score_en=1;score_addr=exp_addr; end
   if(st==EXP_WRITE) begin exp_en=1;exp_we=1;exp_buf_addr=exp_addr;exp_wdata=exp_y; end
   if(st==NORM_REQ) begin exp_en=1;exp_buf_addr=norm_addr; end
 end
 softmax_sram_16kb u_score(.clk,.en(score_en),.we(score_we),.addr(score_addr),.wdata(score_wdata),.rdata(score_rdata),.rvalid(score_rvalid));
 softmax_sram_16kb u_exp(.clk,.en(exp_en),.we(exp_we),.addr(exp_buf_addr),.wdata(exp_wdata),.rdata(exp_rdata),.rvalid(exp_rvalid));
 fp32_max16_pipe umax(.clk,.rst_n,.in_valid(st==MAX_WAIT && score_rvalid),
   .a(score_rdata),.keep(cur_keep),.y(local_max),.out_valid(local_max_v));
 generate for(genvar g=0;g<16;g++) begin: g_fp
   logic sv,ev,mv;
   fp32_add us(.clk,.rst_n,.in_valid(st==EXP_SUB),.a(exp_src[g]),.b({~running_max[31],running_max[30:0]}),.y(sub_y[g]),.out_valid(sv));
   fp32_exp ue(.clk,.rst_n,.in_valid(sv),.x(cur_keep[g]?sub_y[g]:NEG_INF),.y(exp_y[g]),.out_valid(ev));
   fp32_mul um(.clk,.rst_n,.in_valid(st==NORM_MUL),.a(cur_keep[g]?norm_src[g]:0),.b(inv_sum),.y(mul_y[g]),.out_valid(mv));
   if(g==0) begin assign sub_v=sv; assign exp_v=ev; assign mul_v=mv; end
 end endgenerate
 fp32_sum16 usum(.clk,.rst_n,.in_valid(st==EXP_WRITE),.a(exp_y),.y(sum_y),.out_valid(sum_v));
 fp32_add uacc(.clk,.rst_n,.in_valid(sum_v),.a(running_sum),.b(sum_y),.y(acc_y),.out_valid(acc_v));
 fp32_recip urec(.clk,.rst_n,.in_valid(st==RECIP_ISSUE),.a(running_sum),.y(recip_y),.out_valid(recip_v));
 assign in_ready=(st==IDLE)||(st==FILL); assign out_valid=out_v;assign out_data=out_data_r;assign out_keep=out_keep_r;assign out_last=out_last_r;assign done=(st==DONE);
 always_ff @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin st<=IDLE;fill_addr<=0;max_addr<=0;exp_addr<=0;norm_addr<=0;chunks<=0;len_q<=0;running_max<=NEG_INF;running_sum<=0;inv_sum<=0;cur_keep<=0;out_v<=0;out_data_r<=0;out_keep_r<=0;out_last_r<=0; end else begin
   case(st)
    IDLE: if(in_valid) begin len_q<=seq_len;chunks<=(seq_len+15)>>4;fill_addr<=0;running_max<=NEG_INF;running_sum<=0; if(((seq_len+15)>>4)==1) st<=MAX_REQ; else begin fill_addr<=1;st<=FILL;end end
    FILL: if(in_valid) begin if(fill_addr==chunks-1) begin max_addr<=0;st<=MAX_REQ;end else fill_addr<=fill_addr+1; end
    MAX_REQ: begin cur_keep<=keep_for(len_q,max_addr);st<=MAX_WAIT;end
    MAX_WAIT: if(score_rvalid) st<=MAX_REDUCE_WAIT;
    MAX_REDUCE_WAIT: if(local_max_v) begin
      if(gt(local_max,running_max)) running_max<=local_max;
      if(max_addr==chunks-1) begin exp_addr<=0;st<=EXP_REQ;end
      else begin max_addr<=max_addr+1;st<=MAX_REQ;end
    end
    EXP_REQ: begin cur_keep<=keep_for(len_q,exp_addr);st<=EXP_WAIT_RD;end
    EXP_WAIT_RD: if(score_rvalid) begin exp_src<=score_rdata;st<=EXP_SUB;end
    EXP_SUB: st<=EXP_WAIT;
    EXP_WAIT: if(exp_v) st<=EXP_WRITE;
    EXP_WRITE: st<=EXP_WAIT_SUM;
    EXP_WAIT_SUM: if(sum_v) st<=EXP_WAIT_ACC;
    EXP_WAIT_ACC: if(acc_v) begin running_sum<=acc_y; if(exp_addr==chunks-1) st<=EXP_DRAIN; else begin exp_addr<=exp_addr+1;st<=EXP_REQ;end end
    EXP_DRAIN: st<=RECIP_ISSUE;
    RECIP_ISSUE: st<=RECIP_WAIT;
    RECIP_WAIT: if(recip_v) begin inv_sum<=recip_y;norm_addr<=0;st<=NORM_REQ;end
    NORM_REQ: begin cur_keep<=keep_for(len_q,norm_addr);st<=NORM_WAIT_RD;end
    NORM_WAIT_RD: if(exp_rvalid) begin norm_src<=exp_rdata;st<=NORM_MUL;end
    NORM_MUL: st<=NORM_WAIT;
    NORM_WAIT: if(mul_v) begin out_data_r<=mul_y;out_keep_r<=cur_keep;out_last_r<=(norm_addr==chunks-1);out_v<=1;st<=NORM_SEND;end
    NORM_SEND: if(out_v&&out_ready) begin out_v<=0;if(out_last_r) st<=DONE; else begin norm_addr<=norm_addr+1;st<=NORM_REQ;end end
    DONE: st<=IDLE; default: st<=IDLE;
   endcase
 end end
endmodule
