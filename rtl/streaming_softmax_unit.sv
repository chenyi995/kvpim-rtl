// streaming_softmax_unit.sv -- stable sequence softmax, folded 16 lanes/tile.
// Two physical banks are deliberately retained: raw score then exp.  Hence a
// 2048-token, 16-lane context uses 16 KiB; CONTEXTS=16 models Fugue's 256 KiB.
module streaming_softmax_unit import fugue_pkg::*; #(
    parameter integer LANES      = 16,
    parameter integer MAX_TOKENS = 2048,
    parameter integer CONTEXTS   = 1,
    parameter integer WORDS      = (MAX_TOKENS+LANES-1)/LANES,
    parameter integer WIDX_W     = (WORDS<=1) ? 1 : $clog2(WORDS),
    parameter integer CTX_W      = (CONTEXTS<=1) ? 1 : $clog2(CONTEXTS)
) (
    input logic clk, input logic rst_n,
    input logic in_valid, output logic in_ready,
    input logic [CTX_W-1:0] in_context,
    input logic [31:0] seq_len,
    input logic [LANES-1:0][31:0] in_data,
    output logic [LANES-1:0][31:0] out_data,
    output logic [LANES-1:0] out_lane_valid,
    output logic [WIDX_W-1:0] out_word_idx,
    output logic [CTX_W-1:0] out_context,
    output logic out_valid, output logic busy
);
    localparam logic [31:0] NEG_INF = 32'hff80_0000;
    // Technology wrappers may replace these inferred SRAM banks.
    (* ram_style = "block" *) logic [LANES-1:0][31:0] score_mem[CONTEXTS][WORDS];
    (* ram_style = "block" *) logic [LANES-1:0][31:0] exp_mem  [CONTEXTS][WORDS];
    (* ram_style = "block" *) logic [LANES-1:0]       valid_mem[CONTEXTS][WORDS];

    function automatic logic gt(input logic [31:0] a,input logic [31:0] b);
      logic sa,sb; logic [30:0] ma,mb;
      begin sa=a[31];sb=b[31];ma=a[30:0];mb=b[30:0];
        if(sa!=sb) gt=((ma!=0||mb!=0)&&!sa); else if(!sa) gt=(ma>mb); else gt=(ma<mb); end
    endfunction
    // A word *index* needs clog2(WORDS) bits; the word *count* also has to
    // represent WORDS itself (128 for a 2048-token sequence), hence one more.
    function automatic [WIDX_W:0] nwords(input logic [31:0] n);
      logic [31:0] x; begin x=(n==0)?MAX_TOKENS:n; nwords=(x+LANES-1)/LANES; end
    endfunction

    typedef enum logic [3:0] {
      IDLE=4'd0, COLLECT=4'd1, RD_SCORE=4'd2, WAIT_SCORE=4'd3,
      SUB_I=4'd4, SUB_W=4'd5, EXP_W=4'd6, TREE_I=4'd7,
      TREE_W=4'd8, ACC_W=4'd9, RECIP_W=4'd10, RD_EXP=4'd11,
      WAIT_EXP=4'd12, NORM_W=4'd13
    } st_t;
    st_t st;
    logic [CTX_W-1:0] ctx;
    logic [WIDX_W-1:0] wr_i,rd_i,work_i;
    logic [WIDX_W:0] word_count;
    logic [31:0] len_q,gmax,gsum,recip;
    logic [LANES-1:0][31:0] score_q,exp_q,e_q;
    logic [LANES-1:0] mask_q,in_mask;
    logic [31:0] tile_max;
    integer k;
    always_comb begin
      logic [31:0] rem; rem=((seq_len==0)?MAX_TOKENS:seq_len)-(wr_i*LANES);
      for(k=0;k<LANES;k++) in_mask[k]=(rem>k);
      tile_max=NEG_INF;
      for(k=0;k<LANES;k++) if(in_mask[k]&&gt(in_data[k],tile_max)) tile_max=in_data[k];
    end
    assign in_ready=(st==IDLE)||(st==COLLECT);
    assign busy=(st!=IDLE);
    logic subv,expv,treev,accv,recipv,normv,sub_issue,tree_issue,recip_issue,norm_issue;
    logic [LANES-1:0][31:0] sub_y,exp_y,norm_y;
    logic [31:0] t1[8],t2[4],t3[2],tree_y,acc_y,recip_y;
    logic t1v[8],t2v[4],t3v[2];
    assign sub_issue=(st==SUB_I); assign tree_issue=(st==TREE_I);
    genvar g;
    generate for(g=0;g<16;g++) begin:G
      logic a,b,c;
      fp32_add u0(.clk,.rst_n,.in_valid(sub_issue),.a(score_q[g]),.b({~gmax[31],gmax[30:0]}),.y(sub_y[g]),.out_valid(a));
      fp32_exp u1(.clk,.rst_n,.in_valid(subv),.x(mask_q[g]?sub_y[g]:NEG_INF),.y(exp_y[g]),.out_valid(b));
      fp32_mul u2(.clk,.rst_n,.in_valid(norm_issue),.a(mask_q[g]?exp_q[g]:0),.b(recip),.y(norm_y[g]),.out_valid(c));
      if(g==0) begin assign subv=a; assign expv=b; assign normv=c; end
    end
    for(g=0;g<8;g++) fp32_add a1(.clk,.rst_n,.in_valid(tree_issue),.a(e_q[2*g]),.b(e_q[2*g+1]),.y(t1[g]),.out_valid(t1v[g]));
    for(g=0;g<4;g++) fp32_add a2(.clk,.rst_n,.in_valid(t1v[2*g]),.a(t1[2*g]),.b(t1[2*g+1]),.y(t2[g]),.out_valid(t2v[g]));
    for(g=0;g<2;g++) fp32_add a3(.clk,.rst_n,.in_valid(t2v[2*g]),.a(t2[2*g]),.b(t2[2*g+1]),.y(t3[g]),.out_valid(t3v[g]));
    endgenerate
    fp32_add at(.clk,.rst_n,.in_valid(t3v[0]),.a(t3[0]),.b(t3[1]),.y(tree_y),.out_valid(treev));
    fp32_add aa(.clk,.rst_n,.in_valid(treev),.a(gsum),.b(tree_y),.y(acc_y),.out_valid(accv));
    fp32_recip ar(.clk,.rst_n,.in_valid(recip_issue),.a(gsum),.y(recip_y),.out_valid(recipv));
    assign out_data=norm_y; assign out_lane_valid=mask_q; assign out_word_idx=work_i; assign out_context=ctx; assign out_valid=normv;
    always_ff @(posedge clk or negedge rst_n) begin
      if(!rst_n) begin st<=IDLE;wr_i<=0;rd_i<=0;word_count<=0;work_i<=0;ctx<=0;len_q<=0;gmax<=NEG_INF;gsum<=0;recip<=0;score_q<=0;exp_q<=0;mask_q<=0;e_q<=0;recip_issue<=0;norm_issue<=0; end else begin
        recip_issue<=0; norm_issue<=0;
        case(st)
          IDLE:if(in_valid)begin ctx<=in_context;len_q<=(seq_len==0)?MAX_TOKENS:seq_len;score_mem[in_context][0]<=in_data;valid_mem[in_context][0]<=in_mask;gmax<=tile_max;wr_i<=1;if(nwords(seq_len)==1)begin word_count<=1;rd_i<=0;gsum<=0;st<=RD_SCORE;end else st<=COLLECT;end
          COLLECT:if(in_valid)begin score_mem[ctx][wr_i]<=in_data;valid_mem[ctx][wr_i]<=in_mask;if(gt(tile_max,gmax))gmax<=tile_max;if(wr_i==nwords(len_q)-1)begin word_count<=nwords(len_q);rd_i<=0;gsum<=0;st<=RD_SCORE;end else wr_i<=wr_i+1;end
          RD_SCORE:begin work_i<=rd_i;score_q<=score_mem[ctx][rd_i];mask_q<=valid_mem[ctx][rd_i];st<=WAIT_SCORE;end
          WAIT_SCORE:st<=SUB_I;
          // *_I emits exactly one transaction; *_W waits for its result.  Holding
          // in_valid high here would launch a new transaction every clock and
          // leave stale pipeline responses to corrupt the next tile.
          SUB_I:st<=SUB_W;
          SUB_W:if(subv)st<=EXP_W;
          EXP_W:if(expv)begin e_q<=exp_y;exp_mem[ctx][work_i]<=exp_y;st<=TREE_I;end
          TREE_I:st<=TREE_W;
          TREE_W:if(treev)st<=ACC_W;
          ACC_W:if(accv)begin gsum<=acc_y;if(work_i==word_count-1)begin recip_issue<=1;st<=RECIP_W;end else begin rd_i<=rd_i+1;st<=RD_SCORE;end end
          RECIP_W:if(recipv)begin recip<=recip_y;rd_i<=0;st<=RD_EXP;end RD_EXP:begin work_i<=rd_i;exp_q<=exp_mem[ctx][rd_i];mask_q<=valid_mem[ctx][rd_i];st<=WAIT_EXP;end WAIT_EXP:begin norm_issue<=1;st<=NORM_W;end NORM_W:if(normv)if(work_i==word_count-1)st<=IDLE;else begin rd_i<=rd_i+1;st<=RD_EXP;end
          default:st<=IDLE;
        endcase
      end
    end
endmodule
