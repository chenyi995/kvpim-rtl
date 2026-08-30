// kv_seg_tlb.sv — fully-associative *range* CAM of segment descriptors.
//
// Lookup (request t, response t+2): (ctx, layer, kind, pos) hits entry i when
//     valid && ctx/layer/kind equal && vpos_start <= pos < vpos_end.
//   S1 = ENTRIES-way range match + descriptor select,
//   S2 = key address = key_base + ((pos - vpos_start) << STRIDE_SHIFT).
// Fill: FIFO replacement, except that a descriptor with the same
//   (ctx, layer, kind, vpos_start) overwrites the resident copy (ATTACH after
//   demand fills must not duplicate entries).
// Iterate (request t, response t+2): among the resident entries of
//   (ctx, layer) whose kind is selected by it_pools, that overlap [lo, hi) and
//   are not in it_done, return the one with the SMALLEST key_base.  This is
//   drampim's scan_runs ordering ("present each pool to Ramulator in
//   physical-address order") — a min-key tournament tree over the entries,
//   split into two pipeline stages at level IT_SPLIT.
// Entries are kept as flat DESC_W vectors (Icarus cannot member-index an
// unpacked array of packed structs with a loop variable); field offsets come
// from kv_tlb_pkg.
module kv_seg_tlb import kv_tlb_pkg::*; #(
    parameter integer ENTRIES  = KV_TLB_ENTRIES,           // power of two
    parameter integer IDXW     = (ENTRIES <= 1) ? 1 : $clog2(ENTRIES),
    parameter integer IT_SPLIT = ((ENTRIES <= 1) ? 1 : $clog2(ENTRIES)) / 2
) (
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic                 flush,
    // ---- lookup ----
    input  logic                 lk_valid,
    input  logic [CTX_W-1:0]     lk_ctx,
    input  logic [LAYER_W-1:0]   lk_layer,
    input  logic                 lk_kind,
    input  logic [POS_W-1:0]     lk_pos,
    output logic                 lk_resp_valid,
    output logic                 lk_resp_hit,
    output seg_desc_t            lk_resp_desc,
    output logic [KV_ADDR_W-1:0]   lk_resp_key_addr,
    // ---- fill ----
    input  logic                 fill_valid,
    input  seg_desc_t            fill_desc,
    // ---- iterate (min key_base first) ----
    input  logic                 it_valid,
    input  logic [CTX_W-1:0]     it_ctx,
    input  logic [LAYER_W-1:0]   it_layer,
    input  logic [1:0]           it_pools,     // bit0 master, bit1 diff
    input  logic [POS_W-1:0]     it_lo,
    input  logic [POS_W-1:0]     it_hi,
    input  logic [ENTRIES-1:0]   it_done,
    output logic                 it_resp_valid,
    output logic                 it_found,
    output logic [IDXW-1:0]      it_idx,
    output seg_desc_t            it_desc
);
    localparam integer LV = (ENTRIES <= 1) ? 1 : $clog2(ENTRIES);   // tree levels

    logic [DESC_W-1:0] ent [ENTRIES];
    logic [IDXW-1:0]   fifo_ptr;

    // ================= lookup =================
    logic [ENTRIES-1:0] lk_match;
    always_comb begin
        for (int i = 0; i < ENTRIES; i++)
            lk_match[i] = ent[i][D_VALID_B] &&
                          (ent[i][D_CTX_B   +: CTX_W]   == lk_ctx)   &&
                          (ent[i][D_LAYER_B +: LAYER_W] == lk_layer) &&
                          (ent[i][D_KIND_B]             == lk_kind)  &&
                          (lk_pos >= ent[i][D_VSTART_B +: POS_W])    &&
                          (lk_pos <  ent[i][D_VEND_B   +: POS_W]);
    end
    logic            lk_hit_c;
    logic [IDXW-1:0] lk_idx_c;
    always_comb begin
        lk_hit_c = 1'b0; lk_idx_c = '0;
        for (int i = ENTRIES-1; i >= 0; i--)
            if (lk_match[i]) begin lk_hit_c = 1'b1; lk_idx_c = IDXW'(i); end
    end
    seg_desc_t lk_sel_c;
    assign lk_sel_c = ent[lk_idx_c];

    logic             s1_valid, s1_hit;
    seg_desc_t        s1_desc;
    logic [POS_W-1:0] s1_rel;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s1_valid <= 1'b0; s1_hit <= 1'b0; s1_desc <= '0; s1_rel <= '0;
            lk_resp_valid <= 1'b0; lk_resp_hit <= 1'b0; lk_resp_desc <= '0; lk_resp_key_addr <= '0;
        end else begin
            s1_valid <= lk_valid;
            s1_hit   <= lk_hit_c;
            s1_desc  <= lk_sel_c;
            s1_rel   <= lk_pos - lk_sel_c.vpos_start;
            lk_resp_valid    <= s1_valid;
            lk_resp_hit      <= s1_hit;
            lk_resp_desc     <= s1_desc;
            lk_resp_key_addr <= s1_desc.key_base +
                                ({{(KV_ADDR_W-POS_W){1'b0}}, s1_rel} << STRIDE_SHIFT);
        end
    end

    // ================= fill =================
    logic [ENTRIES-1:0] fill_match;
    always_comb begin
        for (int i = 0; i < ENTRIES; i++)
            fill_match[i] = ent[i][D_VALID_B] &&
                            (ent[i][D_CTX_B    +: CTX_W]   == fill_desc.ctx)   &&
                            (ent[i][D_LAYER_B  +: LAYER_W] == fill_desc.layer) &&
                            (ent[i][D_KIND_B]              == fill_desc.kind)  &&
                            (ent[i][D_VSTART_B +: POS_W]   == fill_desc.vpos_start);
    end
    logic            fill_hit;
    logic [IDXW-1:0] fill_idx, fill_slot;
    always_comb begin
        fill_hit = 1'b0; fill_idx = '0;
        for (int i = ENTRIES-1; i >= 0; i--)
            if (fill_match[i]) begin fill_hit = 1'b1; fill_idx = IDXW'(i); end
        fill_slot = fill_hit ? fill_idx : fifo_ptr;
    end
    seg_desc_t fill_in;
    always_comb begin
        fill_in       = fill_desc;
        fill_in.valid = 1'b1;
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fifo_ptr <= '0;
            for (int i = 0; i < ENTRIES; i++) ent[i] <= '0;
        end else if (flush) begin
            fifo_ptr <= '0;
            for (int i = 0; i < ENTRIES; i++) ent[i][D_VALID_B] <= 1'b0;
        end else if (fill_valid) begin
            ent[fill_slot] <= fill_in;
            if (!fill_hit)
                fifo_ptr <= (fifo_ptr == IDXW'(ENTRIES-1)) ? '0 : fifo_ptr + 1'b1;
        end
    end

    // ================= iterate: min-key tournament =================
    logic [ENTRIES-1:0] it_match;
    always_comb begin
        for (int i = 0; i < ENTRIES; i++)
            it_match[i] = ent[i][D_VALID_B] && !it_done[i] &&
                          (ent[i][D_CTX_B   +: CTX_W]   == it_ctx)   &&
                          (ent[i][D_LAYER_B +: LAYER_W] == it_layer) &&
                          (ent[i][D_KIND_B] ? it_pools[1] : it_pools[0]) &&
                          (ent[i][D_VSTART_B +: POS_W] < it_hi)      &&
                          (ent[i][D_VEND_B   +: POS_W] > it_lo);
    end
    // Stage A: levels 1..IT_SPLIT (heap-indexed node arrays; level l has
    // ENTRIES>>l nodes).  Node (l, n) lives at index OFFS(l)+n.
    localparam integer NODES = 2*ENTRIES;
    logic               tv [NODES];
    logic [IDXW-1:0]    ti [NODES];
    logic [KV_ADDR_W-1:0] tk [NODES];
    function automatic integer offs(input integer lvl);
        integer o; o = 0;
        for (int l = 0; l < lvl; l++) o = o + (ENTRIES >> l);
        return o;
    endfunction
    integer ta, tb, to;
    logic   tsel;
    always_comb begin
        for (int i = 0; i < NODES; i++) begin tv[i] = 1'b0; ti[i] = '0; tk[i] = '0; end
        for (int i = 0; i < ENTRIES; i++) begin
            tv[i] = it_match[i]; ti[i] = IDXW'(i); tk[i] = ent[i][D_KEY_B +: KV_ADDR_W];
        end
        ta = 0; tb = 0; to = 0; tsel = 1'b0;
        for (int l = 1; l <= IT_SPLIT; l++)
            for (int n = 0; n < ENTRIES; n++) if (n < (ENTRIES >> l)) begin   // constant bound (unrolls)
                ta = offs(l-1) + 2*n; tb = ta + 1; to = offs(l) + n;
                tsel  = tv[tb] && (!tv[ta] || (tk[tb] < tk[ta]));
                tv[to] = tv[ta] | tv[tb];
                ti[to] = tsel ? ti[tb] : ti[ta];
                tk[to] = tsel ? tk[tb] : tk[ta];
            end
    end
    localparam integer NA = ENTRIES >> IT_SPLIT;      // candidates registered between stages
    logic               av [NA];
    logic [IDXW-1:0]    ai [NA];
    logic [KV_ADDR_W-1:0] ak [NA];
    logic               a_valid;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_valid <= 1'b0;
            for (int n = 0; n < NA; n++) begin av[n] <= 1'b0; ai[n] <= '0; ak[n] <= '0; end
        end else begin
            a_valid <= it_valid;
            for (int n = 0; n < NA; n++) begin
                av[n] <= tv[offs(IT_SPLIT) + n]; ai[n] <= ti[offs(IT_SPLIT) + n]; ak[n] <= tk[offs(IT_SPLIT) + n];
            end
        end
    end
    // Stage B: remaining levels over the NA registered candidates.
    localparam integer NODES_B = 2*NA;
    logic               bv [NODES_B];
    logic [IDXW-1:0]    bi [NODES_B];
    logic [KV_ADDR_W-1:0] bk [NODES_B];
    function automatic integer offs_b(input integer lvl);
        integer o; o = 0;
        for (int l = 0; l < lvl; l++) o = o + (NA >> l);
        return o;
    endfunction
    localparam integer LVB = (NA <= 1) ? 0 : $clog2(NA);
    integer ba, bb, bo;
    logic   bsel;
    always_comb begin
        for (int i = 0; i < NODES_B; i++) begin bv[i] = 1'b0; bi[i] = '0; bk[i] = '0; end
        for (int n = 0; n < NA; n++) begin bv[n] = av[n]; bi[n] = ai[n]; bk[n] = ak[n]; end
        ba = 0; bb = 0; bo = 0; bsel = 1'b0;
        for (int l = 1; l <= LVB; l++)
            for (int n = 0; n < NA; n++) if (n < (NA >> l)) begin
                ba = offs_b(l-1) + 2*n; bb = ba + 1; bo = offs_b(l) + n;
                bsel   = bv[bb] && (!bv[ba] || (bk[bb] < bk[ba]));
                bv[bo] = bv[ba] | bv[bb];
                bi[bo] = bsel ? bi[bb] : bi[ba];
                bk[bo] = bsel ? bk[bb] : bk[ba];
            end
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            it_resp_valid <= 1'b0; it_found <= 1'b0; it_idx <= '0;
        end else begin
            it_resp_valid <= a_valid;
            it_found      <= bv[offs_b(LVB)];
            it_idx        <= bi[offs_b(LVB)];
        end
    end
    assign it_desc = ent[it_idx];
endmodule
