// fugue_pkg.sv — shared parameters, PIM opcodes, and types for the Fugue
// logic die (near-DRAM buffer-die logic for master-diff KV attention).
//
// The Fugue logic die extends AttAcc's HBM buffer-die logic (GEMV + softmax +
// controller) with (1) a TLB that translates logical KV addresses to physical
// DRAM (bank,row,col), and (2) a RoPE rotate unit on the Q/K path.
package fugue_pkg;

  // ---- Datapath widths ---------------------------------------------------
  localparam integer FP16_W = 16;
  localparam integer FP32_W = 32;
  localparam integer LANES  = 16;               // FP16 lanes per word
  localparam integer VEC_W  = LANES * FP16_W;   // 256-bit datapath word

  // ---- Structural counts -------------------------------------------------
  localparam integer NUM_GEMV = 4;    // GEMV units per slice (AttAcc_bank-like)
  localparam integer SM_LANES = 16;   // softmax parallel lanes (paper: up to 256)
  // A 2048-token attention row is processed as 128 sixteen-score tiles.
  // This is also the minimum depth of the Fugue per-word diff-mask table.
  localparam integer SM_WORDS = 128;
  localparam integer SM_WIDX_W= $clog2(SM_WORDS);
  localparam integer HEAD_DIM = 128;  // d_head (GPT-3 175B)

  // ---- Physical DRAM address geometry (8-Hi HBM3, per pseudo-channel) -----
  localparam integer BANK_W = 4;   // 16 banks / pCH
  localparam integer ROW_W  = 16;  // rows / bank
  localparam integer COL_W  = 6;   // 256-bit columns / row (column granularity)

  // ---- Logical (virtual) KV address --------------------------------------
  localparam integer LADDR_W = 32;                 // logical KV / operand addr
  localparam integer PGOFF_W = COL_W;              // page offset (columns in a page)
  localparam integer VPN_W   = LADDR_W - PGOFF_W;  // virtual page number
  localparam integer PPN_W   = BANK_W + ROW_W;     // physical page number
  localparam integer PADDR_W = PPN_W + PGOFF_W;    // physical address

  // ---- TLB ---------------------------------------------------------------
  localparam integer TLB_ENTRIES = 32;
  localparam integer TLB_IDX_W   = $clog2(TLB_ENTRIES);

  // ---- PIM opcodes (extends AttAcc's PIM command set with ROTATE) ---------
  typedef enum logic [3:0] {
    PIM_NOP        = 4'h0,
    PIM_SET_CONFIG = 4'h1,  // write a config register
    PIM_ACT_AB     = 4'h2,  // activate a row in all banks
    PIM_MAC_AB     = 4'h3,  // multiply-accumulate (GEMV) in all banks
    PIM_SFM        = 4'h4,  // softmax
    PIM_ROTATE     = 4'h5,  // RoPE rotate on Q/K   (Fugue-new)
    PIM_WR_GB      = 4'h6,  // write into GEMV buffer
    PIM_MV_GB      = 4'h7,  // move GEMV out -> softmax buffer
    PIM_MV_SB      = 4'h8,  // move softmax out -> GEMV buffer
    PIM_RD_SB      = 4'h9,  // read final result from softmax buffer
    PIM_SET_META   = 4'hA   // load diff-decoder mask (Fugue master-diff merge)
  } opcode_e;

  // ---- Datapath op mode / partitioning -----------------------------------
  typedef enum logic [1:0] {
    OP_SCORE   = 2'b00,  // Q * K^T
    OP_CONTEXT = 2'b01,  // S * V
    OP_ROWWISE = 2'b10,  // row-wise partition (adder-tree reduce)
    OP_COLWISE = 2'b11   // col-wise partition (accumulator)
  } opmode_e;

  // ---- Config register indices (PIM_SET_CONFIG.cfg_idx) ------------------
  typedef enum logic [3:0] {
    CFG_NHEAD    = 4'h0,
    CFG_DHEAD    = 4'h1,
    CFG_SEQLEN   = 4'h2,  // L
    CFG_KVBASE   = 4'h3,  // KV base page (virtual)
    CFG_PARTMODE = 4'h4,
    CFG_ROPEBASE = 4'h5   // RoPE theta base (seed for angle generator)
  } cfg_idx_e;
  localparam integer NUM_CFG = 8;

  // ---- Packed instruction word: {op, mode, cfg_idx, vaddr, len, imm} ------
  typedef struct packed {
    opcode_e            op;       // 4b
    logic [1:0]         mode;     // opmode_e
    logic [3:0]         cfg_idx;  // for SET_CONFIG
    logic [LADDR_W-1:0] vaddr;    // logical operand/KV address (also cfg value)
    logic [15:0]        len;      // rows / elements
    logic [15:0]        imm;      // immediate (token position for ROTATE, etc.)
  } instr_t;
  localparam integer INSTR_W = $bits(instr_t);

  // ---- DRAM command ------------------------------------------------------
  typedef enum logic [2:0] {
    DR_NOP = 3'd0, DR_ACT = 3'd1, DR_RD = 3'd2, DR_WR = 3'd3, DR_PRE = 3'd4
  } dram_cmd_e;

endpackage : fugue_pkg
