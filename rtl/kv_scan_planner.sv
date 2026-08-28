// kv_scan_planner.sv — "tlb_lookup_and_bank_plan" in hardware.
//
// drampim charges every PIM scan `len(scan_runs) x 5 ns` for turning the
// consumer-visible KV rows into physically contiguous runs
// (CacheBlendTLB.scan_runs + _tlb_plan_cost).  This block does that work in
// two phases:
//   A) cover  : walk [pos_lo, pos_hi) segment by segment through the TLB
//               lookup port (demand miss -> PTW fill); a hole -> plan_fault.
//               Skipped when the master pool is not selected.
//   B) order  : repeatedly ask the TLB for the resident (ctx, layer) entry of
//               a selected pool with the smallest key_base that overlaps the
//               range and has not been emitted; clip master entries to the
//               range; merge into the previous run when it is the same pool
//               and physically adjacent (key == prev.key + prev.count*stride).
// Phase B reproduces scan_runs exactly (physical-address order, adjacency
// rule).  Diff descriptors are enumerated from the TLB only, so a plan that
// selects the diff pool must follow ATTACH (ctx, layer) — the paper's
// "load the decoder metadata at attach time".  A diff run is the whole
// diff block (its rows are the corrected positions; the D_i bitmap masks).
module kv_scan_planner import kv_tlb_pkg::*; #(
    parameter integer ENTRIES = KV_TLB_ENTRIES,
    parameter integer IDXW    = (ENTRIES <= 1) ? 1 : $clog2(ENTRIES)
) (
    input  logic                 clk,
    input  logic                 rst_n,
    // ---- plan command ----
    input  logic                 plan_valid,
    output logic                 plan_ready,
    input  logic [CTX_W-1:0]     plan_ctx,
    input  logic [LAYER_W-1:0]   plan_layer,
    input  logic [POS_W-1:0]     plan_lo,
    input  logic [POS_W-1:0]     plan_hi,
    input  logic [1:0]           plan_pools,
    output logic                 plan_done,
    output logic                 plan_fault,
    // ---- TLB lookup ----
    output logic                 lk_valid,
    output logic [CTX_W-1:0]     lk_ctx,
    output logic [LAYER_W-1:0]   lk_layer,
    output logic                 lk_kind,
    output logic [POS_W-1:0]     lk_pos,
    input  logic                 lk_resp_valid,
    input  logic                 lk_resp_hit,
    input  seg_desc_t            lk_resp_desc,
    input  logic [KV_ADDR_W-1:0]   lk_resp_key_addr,
    // ---- TLB iterate ----
    output logic                 it_valid,
    output logic [CTX_W-1:0]     it_ctx,
    output logic [LAYER_W-1:0]   it_layer,
    output logic [1:0]           it_pools,
    output logic [POS_W-1:0]     it_lo,
    output logic [POS_W-1:0]     it_hi,
    output logic [ENTRIES-1:0]   it_done,
    input  logic                 it_resp_valid,
    input  logic                 it_found,
    input  logic [IDXW-1:0]      it_idx,
    input  seg_desc_t            it_desc,
    // ---- PTW ----
    output logic                 walk_valid,
    input  logic                 walk_ready,
    output logic [CTX_W-1:0]     walk_ctx,
    output logic [LAYER_W-1:0]   walk_layer,
    output logic                 walk_kind,
    output logic [POS_W-1:0]     walk_pos,
    input  logic                 walk_done,
    input  logic                 walk_found,
    input  logic                 walk_fault,
    // ---- run stream ----
    output logic                 run_valid,
    input  logic                 run_ready,
    output run_t                 run
);
    typedef enum logic [3:0] {
        S_IDLE, S_M_LK, S_M_WAIT, S_M_WALK, S_M_WALKWAIT,
        S_IT, S_IT_WAIT, S_MERGE, S_EMIT, S_FLUSH, S_DONE
    } state_e;
    state_e state;

    logic [CTX_W-1:0]    r_ctx;
    logic [LAYER_W-1:0]  r_layer;
    logic [POS_W-1:0]    r_lo, r_hi, r_pos;
    logic [1:0]          r_pools;
    logic                r_fault;
    run_t                pending, nrun;
    logic                pending_valid;
    logic [ENTRIES-1:0]  done_mask;

    assign plan_ready = (state == S_IDLE);
    assign plan_done  = (state == S_DONE);
    assign plan_fault = r_fault;
    assign lk_valid   = (state == S_M_LK);
    assign lk_ctx     = r_ctx;
    assign lk_layer   = r_layer;
    assign lk_kind    = KIND_MASTER;
    assign lk_pos     = r_pos;
    assign it_valid   = (state == S_IT);
    assign it_ctx     = r_ctx;
    assign it_layer   = r_layer;
    assign it_pools   = r_pools;
    assign it_lo      = r_lo;
    assign it_hi      = r_hi;
    assign it_done    = done_mask;
    assign walk_valid = (state == S_M_WALK);
    assign walk_ctx   = r_ctx;
    assign walk_layer = r_layer;
    assign walk_kind  = KIND_MASTER;
    assign walk_pos   = r_pos;
    assign run_valid  = (state == S_EMIT) || (state == S_FLUSH && pending_valid);
    assign run        = pending;

    // ---- phase A clip ----
    logic [POS_W-1:0] cover_end;
    assign cover_end = (lk_resp_desc.vpos_end < r_hi) ? lk_resp_desc.vpos_end : r_hi;

    // ---- phase B clip + address ----
    logic [POS_W-1:0]   it_start, it_end;
    logic [KV_ADDR_W-1:0] it_key;
    logic [CNT_W-1:0]   it_count;
    always_comb begin
        it_start = (it_desc.vpos_start > r_lo) ? it_desc.vpos_start : r_lo;
        it_end   = (it_desc.vpos_end   < r_hi) ? it_desc.vpos_end   : r_hi;
        if (it_desc.kind == KIND_DIFF) begin
            it_key   = it_desc.key_base;
            it_count = it_desc.count;
        end else begin
            it_key   = it_desc.key_base +
                       ({{(KV_ADDR_W-POS_W){1'b0}}, it_start - it_desc.vpos_start} << STRIDE_SHIFT);
            it_count = it_end - it_start;
        end
    end

    // ---- merge rule (scan_runs adjacency) ----
    logic [KV_ADDR_W-1:0] pending_end;
    logic               mergeable;
    assign pending_end = pending.key_base +
                         ({{(KV_ADDR_W-CNT_W){1'b0}}, pending.count} << STRIDE_SHIFT);
    assign mergeable   = pending_valid && (pending.kind == nrun.kind) &&
                         (pending.ch_base == nrun.ch_base) && (pending.ch_count == nrun.ch_count) &&
                         (nrun.key_base == pending_end);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            r_ctx <= '0; r_layer <= '0; r_lo <= '0; r_hi <= '0; r_pos <= '0;
            r_pools <= '0; r_fault <= 1'b0;
            pending <= '0; nrun <= '0; pending_valid <= 1'b0; done_mask <= '0;
        end else begin
            unique case (state)
                S_IDLE: begin
                    if (plan_valid) begin
                        r_ctx <= plan_ctx; r_layer <= plan_layer;
                        r_lo <= plan_lo; r_hi <= plan_hi; r_pos <= plan_lo;
                        r_pools <= plan_pools; r_fault <= 1'b0;
                        pending_valid <= 1'b0; done_mask <= '0;
                        if (plan_lo >= plan_hi)   state <= S_DONE;
                        else if (plan_pools[0])   state <= S_M_LK;
                        else if (plan_pools[1])   state <= S_IT;
                        else                      state <= S_DONE;
                    end
                end
                // ---------------- phase A: cover ----------------
                S_M_LK:   state <= S_M_WAIT;
                S_M_WAIT: begin
                    if (lk_resp_valid) begin
                        if (lk_resp_hit) begin
                            r_pos <= cover_end;
                            if (cover_end >= r_hi) state <= S_IT;
                            else                   state <= S_M_LK;
                        end else begin
                            state <= S_M_WALK;
                        end
                    end
                end
                S_M_WALK:     if (walk_ready) state <= S_M_WALKWAIT;
                S_M_WALKWAIT: begin
                    if (walk_done) begin
                        if (walk_found) state <= S_M_LK;
                        else begin r_fault <= 1'b1; state <= S_DONE; end
                    end
                end
                // ---------------- phase B: physical order ----------------
                S_IT:      state <= S_IT_WAIT;
                S_IT_WAIT: begin
                    if (it_resp_valid) begin
                        if (it_found) begin
                            nrun <= {it_key, it_count, it_desc.ch_base, it_desc.ch_count, it_desc.kind};
                            done_mask[it_idx] <= 1'b1;
                            state <= S_MERGE;
                        end else begin
                            state <= S_FLUSH;
                        end
                    end
                end
                S_MERGE: begin
                    if (mergeable) begin
                        pending <= {pending.key_base, pending.count + nrun.count,
                                    pending.ch_base, pending.ch_count, pending.kind};
                        state <= S_IT;
                    end else if (pending_valid) begin
                        state <= S_EMIT;
                    end else begin
                        pending <= nrun; pending_valid <= 1'b1;
                        state <= S_IT;
                    end
                end
                S_EMIT: begin
                    if (run_ready) begin
                        pending <= nrun; pending_valid <= 1'b1;
                        state <= S_IT;
                    end
                end
                S_FLUSH: begin
                    if (!pending_valid) state <= S_DONE;
                    else if (run_ready) begin pending_valid <= 1'b0; state <= S_DONE; end
                end
                S_DONE:  state <= S_IDLE;
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
