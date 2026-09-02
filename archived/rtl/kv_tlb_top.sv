// kv_tlb_top.sv — KV segment TLB + PTW + scan planner (synthesis top).
//
// Command port (one command at a time):
//   OP_LOOKUP : cmd_pos_lo, cmd_pools (01 master / 10 diff) -> one run
//               (key_base/count/pool) on the run stream, cmd_fault if the
//               position is not mapped.
//   OP_PLAN   : [cmd_pos_lo, cmd_pos_hi), cmd_pools bit0 master / bit1 diff
//               -> coalesced run stream (drampim scan_runs).
//   OP_ATTACH : bulk-load every descriptor of (ctx, layer).
//   OP_FLUSH  : invalidate the TLB.
// Memory port: single outstanding 32-B read (HBM transaction).
module kv_tlb_top import kv_tlb_pkg::*; #(
    parameter integer ENTRIES = KV_TLB_ENTRIES
) (
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic [KV_ADDR_W-1:0]    cfg_dir_base,
    // ---- command ----
    input  logic                  cmd_valid,
    output logic                  cmd_ready,
    input  logic [1:0]            cmd_op,
    input  logic [CTX_W-1:0]      cmd_ctx,
    input  logic [LAYER_W-1:0]    cmd_layer,
    input  logic [POS_W-1:0]      cmd_pos_lo,
    input  logic [POS_W-1:0]      cmd_pos_hi,
    input  logic [1:0]            cmd_pools,
    output logic                  cmd_done,
    output logic                  cmd_fault,
    // ---- run stream ----
    output logic                  run_valid,
    input  logic                  run_ready,
    output run_t                  run,
    output logic [KV_ADDR_W-1:0]    run_value_base,
    // ---- memory ----
    output logic                  mem_req_valid,
    input  logic                  mem_req_ready,
    output logic [KV_ADDR_W-1:0]    mem_req_addr,
    input  logic                  mem_resp_valid,
    input  logic [MEM_DATA_W-1:0] mem_resp_data
);
    localparam integer IDXW = (ENTRIES <= 1) ? 1 : $clog2(ENTRIES);

    typedef enum logic [2:0] {T_IDLE, T_PLAN, T_ATTACH, T_ATTACHWAIT, T_FLUSH, T_DONE} state_e;
    state_e state;
    logic [1:0]          r_op, r_pools;
    logic [CTX_W-1:0]    r_ctx;
    logic [LAYER_W-1:0]  r_layer;
    logic [POS_W-1:0]    r_lo, r_hi;
    logic                r_fault;

    // ---- wires ----
    logic                tlb_flush;
    logic                lk_valid, lk_kind, lk_resp_valid, lk_resp_hit;
    logic [CTX_W-1:0]    lk_ctx;
    logic [LAYER_W-1:0]  lk_layer;
    logic [POS_W-1:0]    lk_pos;
    seg_desc_t           lk_resp_desc;
    logic [KV_ADDR_W-1:0]  lk_resp_key_addr;
    logic                fill_valid;
    seg_desc_t           fill_desc;
    logic [CTX_W-1:0]    it_ctx;
    logic [LAYER_W-1:0]  it_layer;
    logic                it_valid, it_resp_valid, it_found;
    logic [1:0]          it_pools;
    logic [POS_W-1:0]    it_lo, it_hi;
    logic [ENTRIES-1:0]  it_done;
    logic [IDXW-1:0]     it_idx;
    seg_desc_t           it_desc;
    logic                pl_walk_valid, pl_walk_kind;
    logic [CTX_W-1:0]    pl_walk_ctx;
    logic [LAYER_W-1:0]  pl_walk_layer;
    logic [POS_W-1:0]    pl_walk_pos;
    logic                walk_valid, walk_ready, walk_attach, walk_kind, walk_done, walk_found, walk_fault;
    logic [CTX_W-1:0]    walk_ctx;
    logic [LAYER_W-1:0]  walk_layer;
    logic [POS_W-1:0]    walk_pos;
    logic                plan_valid, plan_ready, plan_done, plan_fault;

    // ---- PTW ownership: ATTACH from the top, demand walks from the planner ----
    logic attach_owner;
    assign attach_owner = (state == T_ATTACH) || (state == T_ATTACHWAIT);
    assign walk_valid   = attach_owner ? (state == T_ATTACH) : pl_walk_valid;
    assign walk_attach  = attach_owner;
    assign walk_ctx     = attach_owner ? r_ctx   : pl_walk_ctx;
    assign walk_layer   = attach_owner ? r_layer : pl_walk_layer;
    assign walk_kind    = attach_owner ? KIND_MASTER : pl_walk_kind;
    assign walk_pos     = attach_owner ? '0 : pl_walk_pos;

    logic plan_issued;
    assign plan_valid   = (state == T_PLAN) && plan_ready && !plan_issued;

    assign cmd_ready  = (state == T_IDLE);
    assign cmd_done   = (state == T_DONE);
    assign cmd_fault  = r_fault;
    assign tlb_flush  = (state == T_FLUSH);
    assign run_value_base = value_base_of(run.key_base);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= T_IDLE; r_op <= '0; r_pools <= '0; r_ctx <= '0; r_layer <= '0;
            r_lo <= '0; r_hi <= '0; r_fault <= 1'b0; plan_issued <= 1'b0;
        end else begin
            unique case (state)
                T_IDLE: begin
                    if (cmd_valid) begin
                        r_op <= cmd_op; r_pools <= cmd_pools; r_ctx <= cmd_ctx; r_layer <= cmd_layer;
                        r_lo <= cmd_pos_lo;
                        r_hi <= (cmd_op == OP_LOOKUP) ? cmd_pos_lo + 16'd1 : cmd_pos_hi;
                        r_fault <= 1'b0; plan_issued <= 1'b0;
                        unique case (cmd_op)
                            OP_FLUSH:  state <= T_FLUSH;
                            OP_ATTACH: state <= T_ATTACH;
                            default:   state <= T_PLAN;
                        endcase
                    end
                end
                T_PLAN: begin
                    if (plan_valid) plan_issued <= 1'b1;
                    if (plan_issued && plan_done) begin
                        r_fault <= plan_fault;
                        state   <= T_DONE;
                    end
                end
                T_ATTACH:     if (walk_ready) state <= T_ATTACHWAIT;
                T_ATTACHWAIT: if (walk_done) begin r_fault <= walk_fault; state <= T_DONE; end
                T_FLUSH:      state <= T_DONE;
                T_DONE:       state <= T_IDLE;
                default:      state <= T_IDLE;
            endcase
        end
    end

    kv_seg_tlb #(.ENTRIES(ENTRIES)) u_tlb (
        .clk(clk), .rst_n(rst_n), .flush(tlb_flush),
        .lk_valid(lk_valid), .lk_ctx(lk_ctx), .lk_layer(lk_layer), .lk_kind(lk_kind), .lk_pos(lk_pos),
        .lk_resp_valid(lk_resp_valid), .lk_resp_hit(lk_resp_hit), .lk_resp_desc(lk_resp_desc),
        .lk_resp_key_addr(lk_resp_key_addr),
        .fill_valid(fill_valid), .fill_desc(fill_desc),
        .it_valid(it_valid), .it_ctx(it_ctx), .it_layer(it_layer), .it_pools(it_pools),
        .it_lo(it_lo), .it_hi(it_hi), .it_done(it_done),
        .it_resp_valid(it_resp_valid), .it_found(it_found), .it_idx(it_idx), .it_desc(it_desc)
    );

    kv_ptw u_ptw (
        .clk(clk), .rst_n(rst_n), .dir_base(cfg_dir_base),
        .walk_valid(walk_valid), .walk_ready(walk_ready), .walk_attach(walk_attach),
        .walk_ctx(walk_ctx), .walk_layer(walk_layer), .walk_kind(walk_kind), .walk_pos(walk_pos),
        .walk_done(walk_done), .walk_found(walk_found), .walk_fault(walk_fault),
        .fill_valid(fill_valid), .fill_desc(fill_desc),
        .mem_req_valid(mem_req_valid), .mem_req_ready(mem_req_ready), .mem_req_addr(mem_req_addr),
        .mem_resp_valid(mem_resp_valid), .mem_resp_data(mem_resp_data)
    );

    kv_scan_planner #(.ENTRIES(ENTRIES)) u_plan (
        .clk(clk), .rst_n(rst_n),
        .plan_valid(plan_valid), .plan_ready(plan_ready),
        .plan_ctx(r_ctx), .plan_layer(r_layer), .plan_lo(r_lo), .plan_hi(r_hi),
        .plan_pools(r_pools),
        .plan_done(plan_done), .plan_fault(plan_fault),
        .lk_valid(lk_valid), .lk_ctx(lk_ctx), .lk_layer(lk_layer), .lk_kind(lk_kind), .lk_pos(lk_pos),
        .lk_resp_valid(lk_resp_valid), .lk_resp_hit(lk_resp_hit), .lk_resp_desc(lk_resp_desc),
        .lk_resp_key_addr(lk_resp_key_addr),
        .it_valid(it_valid), .it_ctx(it_ctx), .it_layer(it_layer), .it_pools(it_pools),
        .it_lo(it_lo), .it_hi(it_hi), .it_done(it_done),
        .it_resp_valid(it_resp_valid), .it_found(it_found), .it_idx(it_idx), .it_desc(it_desc),
        .walk_valid(pl_walk_valid), .walk_ready(walk_ready && !attach_owner),
        .walk_ctx(pl_walk_ctx), .walk_layer(pl_walk_layer), .walk_kind(pl_walk_kind), .walk_pos(pl_walk_pos),
        .walk_done(walk_done && !attach_owner), .walk_found(walk_found), .walk_fault(walk_fault),
        .run_valid(run_valid), .run_ready(run_ready), .run(run)
    );
endmodule
