// kv_tlb_variants.sv — fixed-ENTRIES wrappers of kv_tlb_top for the capacity
// sweep (avoids tool-specific parameter-override syntax; same pattern as
// rtl/mac_tree16_variants.sv).
module kv_tlb_e16 import kv_tlb_pkg::*; (
    input  logic clk, rst_n, input logic [KV_ADDR_W-1:0] cfg_dir_base,
    input  logic cmd_valid, output logic cmd_ready, input logic [1:0] cmd_op,
    input  logic [CTX_W-1:0] cmd_ctx, input logic [LAYER_W-1:0] cmd_layer,
    input  logic [POS_W-1:0] cmd_pos_lo, cmd_pos_hi, input logic [1:0] cmd_pools,
    output logic cmd_done, cmd_fault,
    output logic run_valid, input logic run_ready, output run_t run, output logic [KV_ADDR_W-1:0] run_value_base,
    output logic mem_req_valid, input logic mem_req_ready, output logic [KV_ADDR_W-1:0] mem_req_addr,
    input  logic mem_resp_valid, input logic [MEM_DATA_W-1:0] mem_resp_data
);
    kv_tlb_top #(.ENTRIES(16)) u (.*);
endmodule

module kv_tlb_e32 import kv_tlb_pkg::*; (
    input  logic clk, rst_n, input logic [KV_ADDR_W-1:0] cfg_dir_base,
    input  logic cmd_valid, output logic cmd_ready, input logic [1:0] cmd_op,
    input  logic [CTX_W-1:0] cmd_ctx, input logic [LAYER_W-1:0] cmd_layer,
    input  logic [POS_W-1:0] cmd_pos_lo, cmd_pos_hi, input logic [1:0] cmd_pools,
    output logic cmd_done, cmd_fault,
    output logic run_valid, input logic run_ready, output run_t run, output logic [KV_ADDR_W-1:0] run_value_base,
    output logic mem_req_valid, input logic mem_req_ready, output logic [KV_ADDR_W-1:0] mem_req_addr,
    input  logic mem_resp_valid, input logic [MEM_DATA_W-1:0] mem_resp_data
);
    kv_tlb_top #(.ENTRIES(32)) u (.*);
endmodule

module kv_tlb_e64 import kv_tlb_pkg::*; (
    input  logic clk, rst_n, input logic [KV_ADDR_W-1:0] cfg_dir_base,
    input  logic cmd_valid, output logic cmd_ready, input logic [1:0] cmd_op,
    input  logic [CTX_W-1:0] cmd_ctx, input logic [LAYER_W-1:0] cmd_layer,
    input  logic [POS_W-1:0] cmd_pos_lo, cmd_pos_hi, input logic [1:0] cmd_pools,
    output logic cmd_done, cmd_fault,
    output logic run_valid, input logic run_ready, output run_t run, output logic [KV_ADDR_W-1:0] run_value_base,
    output logic mem_req_valid, input logic mem_req_ready, output logic [KV_ADDR_W-1:0] mem_req_addr,
    input  logic mem_resp_valid, input logic [MEM_DATA_W-1:0] mem_resp_data
);
    kv_tlb_top #(.ENTRIES(64)) u (.*);
endmodule
