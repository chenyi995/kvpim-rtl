// direct_addr_plan.sv — the AttAcc baseline's address path: no table, no
// translation.  Serves attacc_controller's plan port with ONE affine run
//     key_base = (kv_base_vec + pos_lo) * 256 B,  count = pos_hi - pos_lo
// (AttAcc's KV cache is one private contiguous extent per request — drampim's
// NoReuseKVLayout: `base + position * stride`, no metadata lookup).
// OP_ATTACH / OP_FLUSH complete immediately.  Same port as kv_tlb_top, so the
// A/B area delta of the dies isolates the segment TLB.
module direct_addr_plan import kv_tlb_pkg::*; (
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic [31:0]          kv_base_vec,     // CFG_KVBASE (256-B vector units)
    input  logic                 cmd_valid,
    output logic                 cmd_ready,
    input  logic [1:0]           cmd_op,
    input  logic [POS_W-1:0]     cmd_pos_lo,
    input  logic [POS_W-1:0]     cmd_pos_hi,
    output logic                 cmd_done,
    output logic                 cmd_fault,
    output logic                 run_valid,
    input  logic                 run_ready,
    output logic [KV_ADDR_W-1:0] run_key_base,
    output logic [CNT_W-1:0]     run_count
);
    typedef enum logic [1:0] {D_IDLE, D_RUN, D_DONE} state_e;
    state_e state;

    assign cmd_ready = (state == D_IDLE);
    assign cmd_done  = (state == D_DONE);
    assign cmd_fault = 1'b0;
    assign run_valid = (state == D_RUN);

    logic [KV_ADDR_W-1:0] base_vec;
    assign base_vec = {{(KV_ADDR_W-32){1'b0}}, kv_base_vec} + {{(KV_ADDR_W-POS_W){1'b0}}, cmd_pos_lo};

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= D_IDLE; run_key_base <= '0; run_count <= '0;
        end else begin
            unique case (state)
                D_IDLE: begin
                    if (cmd_valid) begin
                        if ((cmd_op == OP_PLAN || cmd_op == OP_LOOKUP) && (cmd_pos_hi > cmd_pos_lo)) begin
                            run_key_base <= base_vec << STRIDE_SHIFT;
                            run_count    <= cmd_pos_hi - cmd_pos_lo;
                            state        <= D_RUN;
                        end else begin
                            state <= D_DONE;
                        end
                    end
                end
                D_RUN:  if (run_ready) state <= D_DONE;
                D_DONE: state <= D_IDLE;
                default: state <= D_IDLE;
            endcase
        end
    end
endmodule
