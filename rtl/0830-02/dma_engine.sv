// dma_engine.sv — the AttAcc controller's DMA engine (paper §Controller:
// "The data transfer is supported by the DMA engine").  Moves a descriptor's
// worth of 256-bit beats between the xPU-facing I/O port and HBM: a read
// master streams beats into a small staging FIFO, a write master drains it.
// Reads run ahead of writes up to the FIFO depth, so the engine tolerates
// response latency without stalling the bus at either end.
module dma_engine #(
    parameter integer ADDR_W = 34,
    parameter integer DATA_W = 256,
    parameter integer DEPTH  = 4          // staging FIFO beats (power of two)
) (
    input  logic              clk,
    input  logic              rst_n,

    // ---- descriptor: one transfer of len beats ----
    input  logic              desc_valid,
    output logic              desc_ready,
    input  logic [ADDR_W-1:0] desc_src,
    input  logic [ADDR_W-1:0] desc_dst,
    input  logic [15:0]       desc_len,   // beats (DATA_W/8 bytes each)
    output logic              busy,
    output logic              done,       // 1-cycle pulse

    // ---- read master ----
    output logic              rd_req_valid,
    input  logic              rd_req_ready,
    output logic [ADDR_W-1:0] rd_req_addr,
    input  logic              rd_resp_valid,
    input  logic [DATA_W-1:0] rd_resp_data,

    // ---- write master ----
    output logic              wr_req_valid,
    input  logic              wr_req_ready,
    output logic [ADDR_W-1:0] wr_req_addr,
    output logic [DATA_W-1:0] wr_req_data
);
    localparam integer BEAT_BYTES = DATA_W / 8;
    localparam integer PW = $clog2(DEPTH);

    logic [ADDR_W-1:0] src_q, dst_q;
    logic [15:0]       len_q, rd_issued, wr_done_cnt;
    logic              active;

    // staging FIFO
    logic [DATA_W-1:0] fifo [DEPTH];
    logic [PW-1:0]     f_wr, f_rd;
    logic [PW:0]       f_cnt;
    // read responses in flight (issued, not yet in the FIFO)
    logic [PW:0]       inflight;

    wire fifo_empty = (f_cnt == '0);
    wire room       = ({1'b0, f_cnt} + {1'b0, inflight}) < (DEPTH+1)'(DEPTH);

    assign desc_ready   = ~active;
    assign busy         = active;
    assign rd_req_valid = active && room && (rd_issued != len_q);
    assign rd_req_addr  = src_q + (ADDR_W'(rd_issued) * ADDR_W'(BEAT_BYTES));
    assign wr_req_valid = active && !fifo_empty;
    assign wr_req_addr  = dst_q + (ADDR_W'(wr_done_cnt) * ADDR_W'(BEAT_BYTES));
    assign wr_req_data  = fifo[f_rd];

    wire rd_fire  = rd_req_valid && rd_req_ready;
    wire wr_fire  = wr_req_valid && wr_req_ready;
    wire last_wr  = wr_fire && (wr_done_cnt == len_q - 16'd1);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            src_q <= '0; dst_q <= '0; len_q <= '0;
            rd_issued <= '0; wr_done_cnt <= '0;
            active <= 1'b0; done <= 1'b0;
            f_wr <= '0; f_rd <= '0; f_cnt <= '0; inflight <= '0;
            for (int i = 0; i < DEPTH; i++) fifo[i] <= '0;
        end else begin
            done <= 1'b0;

            if (!active && desc_valid && (desc_len != 16'd0)) begin
                src_q <= desc_src; dst_q <= desc_dst; len_q <= desc_len;
                rd_issued <= '0; wr_done_cnt <= '0;
                active <= 1'b1;
            end

            if (rd_fire) rd_issued <= rd_issued + 16'd1;

            if (rd_resp_valid) begin
                fifo[f_wr] <= rd_resp_data;
                f_wr <= f_wr + 1'b1;
            end
            inflight <= inflight + ((PW+1)'(rd_fire)) - ((PW+1)'(rd_resp_valid));
            f_cnt    <= f_cnt + ((PW+1)'(rd_resp_valid)) - ((PW+1)'(wr_fire));

            if (wr_fire) begin
                f_rd <= f_rd + 1'b1;
                wr_done_cnt <= wr_done_cnt + 16'd1;
            end

            if (last_wr) begin
                active <= 1'b0;
                done   <= 1'b1;
            end
        end
    end
endmodule
