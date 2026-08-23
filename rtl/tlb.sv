// tlb.sv — Fugue KV translation-lookaside buffer.
//
// Translates a logical KV virtual page number (VPN) to a physical DRAM page
// number (PPN = {bank, row}). Fully-associative, TLB_ENTRIES entries, FIFO
// replacement. On a hit the PPN is returned in one cycle; on a miss a
// page-walk is modeled (MISS_LAT cycles) that fills the entry from a linear
// page table (PPN = base_ppn + VPN — the same linear index->row mapping style
// as kvpim-rtl's master_addr_decode), then returns the filled PPN.
//
// Single outstanding request; `busy` stalls the caller during a miss walk.
module tlb import fugue_pkg::*; #(
    parameter int unsigned ENTRIES  = TLB_ENTRIES,
    parameter int unsigned MISS_LAT = 8
) (
    input  logic             clk,
    input  logic             rst_n,
    input  logic             req_valid,
    input  logic [VPN_W-1:0] req_vpn,
    input  logic [PPN_W-1:0] base_ppn,    // KV base physical page (fill source)
    output logic [PPN_W-1:0] resp_ppn,
    output logic             resp_hit,
    output logic             resp_valid,
    output logic             busy
);
    localparam int unsigned IDXW = (ENTRIES <= 1) ? 1 : $clog2(ENTRIES);
    localparam int unsigned LATW = $clog2(MISS_LAT + 2);

    // Fully-associative CAM: valid + tag + ppn per entry.
    logic             v_arr   [ENTRIES];
    logic [VPN_W-1:0] tag_arr [ENTRIES];
    logic [PPN_W-1:0] ppn_arr [ENTRIES];
    logic [IDXW-1:0]  fifo_ptr;

    // Combinational lookup.
    logic [ENTRIES-1:0] match;
    always_comb begin
        for (int i = 0; i < ENTRIES; i++)
            match[i] = v_arr[i] && (tag_arr[i] == req_vpn);
    end
    logic            hit_any;
    logic [IDXW-1:0] hit_idx;
    always_comb begin
        hit_any = 1'b0;
        hit_idx = '0;
        for (int i = 0; i < ENTRIES; i++)
            if (match[i]) begin
                hit_any = 1'b1;
                hit_idx = i[IDXW-1:0];
            end
    end

    typedef enum logic {S_IDLE, S_MISS} state_e;
    state_e            state;
    logic [LATW-1:0]   cnt;
    logic [VPN_W-1:0]  miss_vpn;
    logic [PPN_W-1:0]  fill_ppn;
    // Linear page-table model (representative; real walk would index DRAM).
    assign fill_ppn = base_ppn + miss_vpn[PPN_W-1:0];

    assign busy = (state == S_MISS);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= S_IDLE;
            cnt        <= '0;
            fifo_ptr   <= '0;
            miss_vpn   <= '0;
            resp_ppn   <= '0;
            resp_hit   <= 1'b0;
            resp_valid <= 1'b0;
            for (int i = 0; i < ENTRIES; i++) v_arr[i] <= 1'b0;  // tag/ppn need no reset
        end else begin
            resp_valid <= 1'b0;
            unique case (state)
                S_IDLE: begin
                    if (req_valid) begin
                        if (hit_any) begin
                            resp_ppn   <= ppn_arr[hit_idx];
                            resp_hit   <= 1'b1;
                            resp_valid <= 1'b1;
                        end else begin
                            miss_vpn <= req_vpn;
                            cnt      <= LATW'(MISS_LAT);
                            state    <= S_MISS;
                        end
                    end
                end
                S_MISS: begin
                    if (cnt <= LATW'(1)) begin
                        v_arr  [fifo_ptr] <= 1'b1;
                        tag_arr[fifo_ptr] <= miss_vpn;
                        ppn_arr[fifo_ptr] <= fill_ppn;
                        fifo_ptr          <= (fifo_ptr == IDXW'(ENTRIES-1)) ? '0 : fifo_ptr + 1'b1;
                        resp_ppn   <= fill_ppn;
                        resp_hit   <= 1'b0;
                        resp_valid <= 1'b1;
                        state      <= S_IDLE;
                    end else begin
                        cnt <= cnt - 1'b1;
                    end
                end
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
