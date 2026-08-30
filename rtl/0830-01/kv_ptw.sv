// kv_ptw.sv — page-table walker for the KV segment TLB.
//
// The page table is drampim's CacheBlendTLB block table laid out in HBM:
//   directory[ {ctx, layer, kind} ]  (64-bit, at dir_base + 8*index)
//       -> {seg_base, seg_count}: a 32-B aligned array of 128-bit segment
//          descriptors sorted by vpos_start (two per 32-B transaction).
// Demand walk (walk_attach=0): one directory read, then a binary search over
// the array (one 32-B read per probe, ceil(log2(seg_count)) probes worst
// case), fill the hit descriptor.  Not covered -> walk_fault.
// Attach walk (walk_attach=1): read both kinds' directories and stream every
// descriptor of (ctx, layer) into the TLB (the paper's "load decoder
// metadata at attach time").
// Single outstanding memory request; latency of the memory itself is
// external, so a synthesized-cycle count of this block is the PTW *logic*
// latency.
module kv_ptw import kv_tlb_pkg::*; (
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic [KV_ADDR_W-1:0]    dir_base,
    // ---- walk command ----
    input  logic                  walk_valid,
    output logic                  walk_ready,
    input  logic                  walk_attach,
    input  logic [CTX_W-1:0]      walk_ctx,
    input  logic [LAYER_W-1:0]    walk_layer,
    input  logic                  walk_kind,
    input  logic [POS_W-1:0]      walk_pos,
    output logic                  walk_done,
    output logic                  walk_found,
    output logic                  walk_fault,
    // ---- TLB fill ----
    output logic                  fill_valid,
    output seg_desc_t             fill_desc,
    // ---- memory (32-B aligned reads) ----
    output logic                  mem_req_valid,
    input  logic                  mem_req_ready,
    output logic [KV_ADDR_W-1:0]    mem_req_addr,
    input  logic                  mem_resp_valid,
    input  logic [MEM_DATA_W-1:0] mem_resp_data
);
    typedef enum logic [3:0] {
        S_IDLE, S_DIR_REQ, S_DIR_WAIT,
        S_BS_REQ, S_BS_WAIT, S_BS_EVAL,
        S_AT_REQ, S_AT_WAIT, S_AT_EMIT1,
        S_DONE
    } state_e;
    state_e state;

    logic                 r_attach, r_kind;
    logic [CTX_W-1:0]     r_ctx;
    logic [LAYER_W-1:0]   r_layer;
    logic [POS_W-1:0]     r_pos;
    logic                 r_found, r_fault;
    logic [KV_ADDR_W-1:0]   seg_base;
    logic [SEGCNT_W-1:0]  seg_count;
    logic signed [SEGCNT_W+1:0] lo, hi, mid;   // binary-search bounds (may go to -1)
    logic [SEGCNT_W:0]    at_idx;              // attach cursor (0..seg_count)
    logic [1:0]           dir_sel;             // directory entry within the word
    logic                 desc_sel;            // descriptor within the word
    logic [MEM_DATA_W-1:0] word;
    seg_desc_t            bs_desc;

    // ---- address generation ----
    logic [KV_ADDR_W-1:0] dir_addr, bs_addr, at_addr;
    assign dir_addr = dir_entry_addr(dir_base, r_ctx, r_layer, r_kind);
    assign bs_addr  = seg_base + ({{(KV_ADDR_W-SEGCNT_W-2){1'b0}}, mid[SEGCNT_W+1:0]} << 4);
    assign at_addr  = seg_base + ({{(KV_ADDR_W-SEGCNT_W-1){1'b0}}, at_idx} << 4);

    logic lo_gt_hi;
    assign lo_gt_hi = (lo > hi);

    always_comb begin
        mem_req_valid = 1'b0;
        mem_req_addr  = '0;
        unique case (state)
            S_DIR_REQ: begin mem_req_valid = 1'b1; mem_req_addr = {dir_addr[KV_ADDR_W-1:5], 5'b0}; end
            S_BS_REQ:  begin mem_req_valid = !lo_gt_hi; mem_req_addr = {bs_addr[KV_ADDR_W-1:5], 5'b0}; end
            S_AT_REQ:  begin mem_req_valid = (at_idx < {1'b0, seg_count}); mem_req_addr = {at_addr[KV_ADDR_W-1:5], 5'b0}; end
            default: ;
        endcase
    end

    assign walk_ready = (state == S_IDLE);
    assign walk_done  = (state == S_DONE);
    assign walk_found = r_found;
    assign walk_fault = r_fault;

    // directory entry select
    dir_entry_t dir_word_entry;
    always_comb begin
        unique case (dir_sel)
            2'd0: dir_word_entry = mem_resp_data[ 63:  0];
            2'd1: dir_word_entry = mem_resp_data[127: 64];
            2'd2: dir_word_entry = mem_resp_data[191:128];
            default: dir_word_entry = mem_resp_data[255:192];
        endcase
    end
    seg_desc_t resp_desc0, resp_desc1, word_desc1;
    assign resp_desc0 = {mem_resp_data[127:1], 1'b1};   // force valid
    assign resp_desc1 = {mem_resp_data[255:129], 1'b1};
    assign word_desc1 = {word[255:129], 1'b1};
    seg_desc_t bs_desc_v;
    assign bs_desc_v  = {bs_desc[DESC_W-1:1], 1'b1};

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            r_attach <= 1'b0; r_kind <= 1'b0; r_ctx <= '0; r_layer <= '0; r_pos <= '0;
            r_found <= 1'b0; r_fault <= 1'b0;
            seg_base <= '0; seg_count <= '0; lo <= '0; hi <= '0; at_idx <= '0;
            dir_sel <= '0; desc_sel <= 1'b0; word <= '0; bs_desc <= '0;
            fill_valid <= 1'b0; fill_desc <= '0;
        end else begin
            fill_valid <= 1'b0;
            unique case (state)
                S_IDLE: begin
                    if (walk_valid) begin
                        r_attach <= walk_attach;
                        r_kind   <= walk_attach ? KIND_MASTER : walk_kind;
                        r_ctx    <= walk_ctx;
                        r_layer  <= walk_layer;
                        r_pos    <= walk_pos;
                        r_found  <= 1'b0;
                        r_fault  <= 1'b0;
                        state    <= S_DIR_REQ;
                    end
                end
                // ---------------- directory ----------------
                S_DIR_REQ: begin
                    dir_sel <= dir_addr[4:3];
                    if (mem_req_ready) state <= S_DIR_WAIT;
                end
                S_DIR_WAIT: begin
                    if (mem_resp_valid) begin
                        seg_base  <= dir_word_entry.seg_base;
                        seg_count <= dir_word_entry.valid ? dir_word_entry.seg_count : '0;
                        at_idx    <= '0;
                        lo        <= '0;
                        hi        <= $signed({2'b0, dir_word_entry.seg_count}) - 1;
                        if (r_attach) begin
                            state <= S_AT_REQ;              // empty array -> next kind
                        end else if (!dir_word_entry.valid) begin
                            r_fault <= 1'b1;
                            state   <= S_DONE;
                        end else begin
                            state <= S_BS_REQ;
                        end
                    end
                end
                // ---------------- binary search ----------------
                S_BS_REQ: begin
                    if (lo_gt_hi) begin
                        r_fault <= 1'b1;
                        state   <= S_DONE;
                    end else begin
                        desc_sel <= bs_addr[4];
                        if (mem_req_ready) state <= S_BS_WAIT;
                    end
                end
                S_BS_WAIT: begin
                    if (mem_resp_valid) begin
                        bs_desc <= desc_sel ? resp_desc1 : resp_desc0;
                        state   <= S_BS_EVAL;
                    end
                end
                S_BS_EVAL: begin
                    if (r_pos < bs_desc.vpos_start) begin
                        hi    <= mid - 1;
                        state <= S_BS_REQ;
                    end else if (r_pos >= bs_desc.vpos_end) begin
                        lo    <= mid + 1;
                        state <= S_BS_REQ;
                    end else begin
                        fill_valid       <= 1'b1;
                        fill_desc        <= bs_desc_v;
                        r_found          <= 1'b1;
                        state            <= S_DONE;
                    end
                end
                // ---------------- attach (bulk load) ----------------
                S_AT_REQ: begin
                    if (at_idx >= {1'b0, seg_count}) begin
                        if (r_kind == KIND_MASTER) begin
                            r_kind <= KIND_DIFF;
                            state  <= S_DIR_REQ;
                        end else begin
                            r_found <= 1'b1;
                            state   <= S_DONE;
                        end
                    end else if (mem_req_ready) begin
                        state <= S_AT_WAIT;
                    end
                end
                S_AT_WAIT: begin
                    if (mem_resp_valid) begin
                        word            <= mem_resp_data;
                        fill_valid      <= 1'b1;              // even descriptor
                        fill_desc       <= resp_desc0;
                        at_idx          <= at_idx + 1'b1;
                        state           <= S_AT_EMIT1;
                    end
                end
                S_AT_EMIT1: begin
                    if (at_idx < {1'b0, seg_count}) begin   // odd descriptor present
                        fill_valid      <= 1'b1;
                        fill_desc       <= word_desc1;
                        at_idx          <= at_idx + 1'b1;
                    end
                    state <= S_AT_REQ;
                end
                S_DONE: state <= S_IDLE;
                default: state <= S_IDLE;
            endcase
        end
    end

    // mid = (lo + hi) >> 1 is combinational; S_BS_REQ samples it while lo/hi
    // are stable.
    always_comb mid = (lo + hi) >>> 1;
endmodule
