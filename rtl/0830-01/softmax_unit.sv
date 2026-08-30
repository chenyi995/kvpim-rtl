// softmax_unit.sv -- buffered, complete-sequence softmax.
// Scores are first collected in a per-channel SRAM wrapper.  It then
// performs three scans: global max, exp+sum (writing exp SRAM), normalize.
// The enclosing logic die instantiates this block once per channel.  Thus the
// all-channel configuration has 16 instances x 16 softmax_pe leaves = the 256
// PE AttAcc softmax unit.  Capacity is selected by CONTEXTS: 32 KiB/channel
// for AttAcc (2 contexts) and 256 KiB/channel for Fugue (16 contexts).
module softmax_unit import fugue_pkg::*; #(
    parameter integer LANES      = 16,
    parameter integer MAX_TOKENS = 2048,
    parameter integer CONTEXTS   = 32,
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
    logic score_wr_en, score_rd_en, score_rd_valid;
    logic exp_wr_en, exp_rd_en, exp_rd_valid;
    logic [LANES-1:0][31:0] score_rd_data, exp_rd_data;

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
    function automatic logic [LANES-1:0] word_mask(
        input logic [31:0] n, input logic [WIDX_W-1:0] wi);
      logic [31:0] rem;
      begin
        rem = ((n==0)?MAX_TOKENS:n) - (wi*LANES);
        for (int j=0; j<LANES; j++) word_mask[j] = (rem > j);
      end
    endfunction

    typedef enum logic [4:0] {
      IDLE=5'd0, IN_MAX_L1=5'd1, IN_MAX_L2=5'd2, IN_MAX_L3=5'd3,
      COMMIT_WORD=5'd4, COLLECT=5'd5, RD_SCORE=5'd6, WAIT_SCORE=5'd7,
      SUB_I=5'd8, SUB_W=5'd9, EXP_W=5'd10, TREE_I=5'd11,
      TREE_W=5'd12, ACC_W=5'd13, RECIP_W=5'd14, RD_EXP=5'd15,
      WAIT_EXP=5'd16, NORM_W=5'd17
    } st_t;
    st_t st;
    logic [CTX_W-1:0] ctx;
    logic [WIDX_W-1:0] wr_i,rd_i,work_i;
    logic [WIDX_W:0] word_count;
    logic [31:0] len_q,gmax,gsum,recip;
    logic [LANES-1:0][31:0] score_q,exp_q,e_q,in_data_q;
    logic [LANES-1:0] mask_q,in_mask;
    logic [31:0] tile_max, max1[8], max2[4], max3[2], in_for_max[16];
    logic [31:0] max_l1_q[8], max_l2_q[4], max_l3_q[2];
    integer k;
    always_comb begin
      logic [31:0] rem; rem=len_q-(wr_i*LANES);
      for(k=0;k<LANES;k++) in_mask[k]=(rem>k);
      for(k=0;k<16;k++) in_for_max[k]=in_mask[k] ? in_data_q[k] : NEG_INF;
      for(k=0;k<8;k++) max1[k]=gt(in_for_max[2*k],in_for_max[2*k+1]) ? in_for_max[2*k] : in_for_max[2*k+1];
      for(k=0;k<4;k++) max2[k]=gt(max_l1_q[2*k],max_l1_q[2*k+1]) ? max_l1_q[2*k] : max_l1_q[2*k+1];
      for(k=0;k<2;k++) max3[k]=gt(max_l2_q[2*k],max_l2_q[2*k+1]) ? max_l2_q[2*k] : max_l2_q[2*k+1];
      tile_max=gt(max_l3_q[0],max_l3_q[1]) ? max_l3_q[0] : max_l3_q[1];
    end
    assign in_ready=(st==IDLE)||(st==COLLECT);
    assign busy=(st!=IDLE);
    logic subv,expv,treev,accv,recipv,normv,sub_issue,tree_issue,recip_issue,norm_issue;
    logic [LANES-1:0][31:0] sub_y,exp_y,norm_y;
    logic [31:0] t1[8],t2[4],t3[2],tree_y,acc_y,recip_y;
    logic t1v[8],t2v[4],t3v[2];
    // One score and one exp command may be active in the same cycle because
    // the two physical SRAM arrays are independent single-port banks.
    // The 16-lane comparator tree is registered 8->4->2->1.  A collected
    // input word is committed only after all three tree registers are valid.
    assign score_wr_en = (st == COMMIT_WORD);
    assign score_rd_en = (st == RD_SCORE);
    assign exp_wr_en   = (st == EXP_W) && expv;
    assign exp_rd_en   = (st == RD_EXP);
    softmax_buffer_sram #(.NUM_CONTEXTS(CONTEXTS), .SEQ_LEN(MAX_TOKENS), .LANES(LANES)) u_sram (
      .clk, .rst_n,
      .score_wr_en, .score_wr_context(ctx), .score_wr_word(wr_i), .score_wr_data(in_data_q),
      .score_rd_en, .score_rd_context(ctx), .score_rd_word(rd_i), .score_rd_data, .score_rd_valid,
      .exp_wr_en, .exp_wr_context(ctx), .exp_wr_word(work_i), .exp_wr_data(exp_y),
      .exp_rd_en, .exp_rd_context(ctx), .exp_rd_word(rd_i), .exp_rd_data, .exp_rd_valid
    );
    assign sub_issue=(st==SUB_I); assign tree_issue=(st==TREE_I);
    genvar g;
    generate for(g=0;g<16;g++) begin:G
      logic a,b,c;
      // Deliberate PE hierarchy: synthesize softmax_pe first, then it can be
      // supplied as a macro/black-box when compiling this softmax hierarchy.
      softmax_pe u_pe(
        .clk,.rst_n,
        .sub_valid(sub_issue), .score(score_q[g]), .neg_max({~gmax[31],gmax[30:0]}),
        .exp_y(exp_y[g]), .sub_done(a), .exp_done(b),
        .norm_valid(norm_issue), .norm_exp(mask_q[g] ? exp_q[g] : 32'd0),
        .reciprocal(recip), .prob_y(norm_y[g]), .norm_done(c)
      );
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
      if(!rst_n) begin st<=IDLE;wr_i<=0;rd_i<=0;word_count<=0;work_i<=0;ctx<=0;len_q<=0;gmax<=NEG_INF;gsum<=0;recip<=0;score_q<=0;exp_q<=0;e_q<=0;in_data_q<=0;mask_q<=0;recip_issue<=0;norm_issue<=0; end else begin
        recip_issue<=0; norm_issue<=0;
        case(st)
          IDLE:if(in_valid)begin ctx<=in_context;len_q<=(seq_len==0)?MAX_TOKENS:seq_len;wr_i<=0;in_data_q<=in_data;st<=IN_MAX_L1;end
          IN_MAX_L1:begin for(k=0;k<8;k++) max_l1_q[k]<=max1[k]; st<=IN_MAX_L2; end
          IN_MAX_L2:begin for(k=0;k<4;k++) max_l2_q[k]<=max2[k]; st<=IN_MAX_L3; end
          IN_MAX_L3:begin for(k=0;k<2;k++) max_l3_q[k]<=max3[k]; st<=COMMIT_WORD; end
          COMMIT_WORD:begin
            if(wr_i==0) gmax<=tile_max; else if(gt(tile_max,gmax)) gmax<=tile_max;
            if(wr_i==nwords(len_q)-1) begin word_count<=nwords(len_q);rd_i<=0;gsum<=0;st<=RD_SCORE;end
            else begin wr_i<=wr_i+1; st<=COLLECT; end
          end
          COLLECT:if(in_valid)begin in_data_q<=in_data;st<=IN_MAX_L1;end
          RD_SCORE:begin work_i<=rd_i;st<=WAIT_SCORE;end
          WAIT_SCORE:if(score_rd_valid)begin score_q<=score_rd_data;mask_q<=word_mask(len_q,work_i);st<=SUB_I;end
          // *_I emits exactly one transaction; *_W waits for its result.  Holding
          // in_valid high here would launch a new transaction every clock and
          // leave stale pipeline responses to corrupt the next tile.
          SUB_I:st<=SUB_W;
          SUB_W:if(subv)st<=EXP_W;
          EXP_W:if(expv)begin e_q<=exp_y;st<=TREE_I;end
          TREE_I:st<=TREE_W;
          TREE_W:if(treev)st<=ACC_W;
          ACC_W:if(accv)begin gsum<=acc_y;if(work_i==word_count-1)begin recip_issue<=1;st<=RECIP_W;end else begin rd_i<=rd_i+1;st<=RD_SCORE;end end
          RECIP_W:if(recipv)begin recip<=recip_y;rd_i<=0;st<=RD_EXP;end
          RD_EXP:begin work_i<=rd_i;st<=WAIT_EXP;end
          WAIT_EXP:if(exp_rd_valid)begin exp_q<=exp_rd_data;mask_q<=word_mask(len_q,work_i);norm_issue<=1;st<=NORM_W;end
          NORM_W:if(normv)if(work_i==word_count-1)st<=IDLE;else begin rd_i<=rd_i+1;st<=RD_EXP;end
          default:st<=IDLE;
        endcase
      end
    end
endmodule
