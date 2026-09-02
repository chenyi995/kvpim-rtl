// fugue_pkg.sv — shared parameters, PIM opcodes, and types for the Fugue
// logic die (near-DRAM buffer-die logic for master-diff KV attention).
//
// The Fugue logic die extends AttAcc's HBM buffer-die logic (GEMV + softmax +
// controller) with (1) a KV *segment* TLB (kv_tlb_pkg / kv_tlb_top: drampim's
// CacheBlendTLB in hardware — logical token positions -> physically contiguous
// K/V runs), (2) a RoPE rotate unit on the Q/K path and (3) the master-diff
// merge decoder.
package fugue_pkg;

  // ---- Datapath widths ---------------------------------------------------
  localparam integer FP16_W = 16;
  localparam integer FP32_W = 32;
  localparam integer LANES  = 16;               // FP16 lanes per word
  localparam integer VEC_W  = LANES * FP16_W;   // 256-bit datapath word

  // ---- Structural counts -------------------------------------------------
  // One 8-Hi HBM3 stack in AttAcc: 16 channels, each with 64 banks.  The
  // selected AttAcc_bank design puts one GEMV unit (and its local buffers) in
  // every bank, hence 1024 GEMV units on this logic-die model.
  localparam integer NUM_CHANNELS       = 16;
  localparam integer GEMV_PER_CHANNEL   = 64;
  localparam integer NUM_GEMV           = NUM_CHANNELS * GEMV_PER_CHANNEL;

  // AttAcc §5.1 provisions 256 FP32 softmax PEs.  They are partitioned as
  // sixteen independent 16-lane softmax engines, one per HBM channel.  Keep
  // SM_LANES as the flattened top-level bus width; SM_PES_PER_CHANNEL is the
  // arithmetic/tree width of one independent softmax operation.
  localparam integer SM_PES_PER_CHANNEL = 16;
  localparam integer SM_CHANNELS        = NUM_CHANNELS;
  localparam integer SM_LANES           = SM_CHANNELS * SM_PES_PER_CHANNEL;
  // Softmax SRAM traffic is 16 FP32 elements = 512 bits/beat.  Each resident
  // context occupies 8 KiB per array.  The two independent score/exp arrays
  // therefore total 32 KiB/channel for AttAcc and 256 KiB/channel for Fugue.
  localparam integer ATTACC_SM_CONTEXTS = 2;
  localparam integer FUGUE_SM_CONTEXTS  = 16;
  // A 2048-token attention row is processed as 128 sixteen-score tiles.
  // This is also the minimum depth of the Fugue per-word diff-mask table.
  localparam integer SM_WORDS = 128;
  localparam integer SM_WIDX_W= $clog2(SM_WORDS);
  localparam integer HEAD_DIM = 128;  // d_head (GPT-3 175B)

  // ---- Physical DRAM address geometry (8-Hi HBM3, per pseudo-channel) -----
  localparam integer BANK_W = 4;   // 16 banks / pCH
  localparam integer ROW_W  = 16;  // rows / bank
  localparam integer COL_W  = 6;   // 256-bit columns / row (column granularity)

  // ---- Logical KV address / instruction operand ----------------------------
  localparam integer LADDR_W = 32;                 // instr operand (token position / cfg value)
  // KV address translation lives in kv_tlb_pkg (segment descriptors, 34-bit
  // HBM byte addresses); the controller decodes a run's byte address into
  // {bank, row, col} of this geometry.

  // ---- PIM opcodes (extends AttAcc's PIM command set with ROTATE) ---------
  typedef enum logic [3:0] {
    PIM_NOP        = 4'h0,
    PIM_SET_CONFIG = 4'h1,  // write a config register
    PIM_ACT_AB     = 4'h2,  // activate a row in all banks
    PIM_MAC_AB     = 4'h3,  // multiply-accumulate (GEMV) in all banks
    PIM_SFM        = 4'h4,  // softmax
    PIM_ROTATE     = 4'h5,  // RoPE rotate on Q/K   (Fugue-new)
    PIM_WR_GB      = 4'h6,  // write into GEMV buffer
    // Direction convention follows the original attacc_drampim code (MVSB =
    // move TO the softmax buffer, MVGB = move TO the GEMV buffer); the OCR'd
    // paper text has the two swapped.
    PIM_MV_GB      = 4'h7,  // move softmax out -> GEMV buffer (die -> bank)
    PIM_MV_SB      = 4'h8,  // move GEMV out -> softmax buffer (bank -> die)
    PIM_RD_SB      = 4'h9,  // read final result from softmax buffer
    PIM_SET_META   = 4'hA,  // load diff-decoder mask (Fugue master-diff merge)
    PIM_ATTACH     = 4'hB   // KV TLB: load (ctx, layer) descriptors; imm[0]=1 -> flush
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
    CFG_KVBASE   = 4'h3,  // AttAcc: KV base (256-B vector units); Fugue: page-table directory base (32-B units)
    CFG_PARTMODE = 4'h4,
    CFG_ROPEBASE = 4'h5,  // RoPE theta base (seed for angle generator)
    CFG_KVCTX    = 4'h6,  // {pools[17:16], layer[14:8], ctx[7:0]} of the KV scans (pools 0 -> master)
    CFG_BATCH    = 4'h7   // batch size.  With imm[15]=1 the same PIM_SET_CONFIG
                          // writes the per-request L table entry imm[4:0]
                          // (paper: config memory stores batch size and the L
                          // of each request within the batch)
  } cfg_idx_e;
  localparam integer NUM_CFG = 8;
  // Per-request sequence-length table depth ("L of each request").
  localparam integer REQ_TABLE_DEPTH = 32;

  // ---- Packed instruction word: {op, mode, cfg_idx, vaddr, len, imm} ------
  typedef struct packed {
    opcode_e            op;       // 4b
    logic [1:0]         mode;     // opmode_e
    logic [3:0]         cfg_idx;  // for SET_CONFIG
    logic [LADDR_W-1:0] vaddr;    // MAC: first logical token position [15:0]; SET_CONFIG: value
    logic [15:0]        len;      // rows / elements
    logic [15:0]        imm;      // immediate (token position for ROTATE, etc.)
  } instr_t;
  localparam integer INSTR_W = $bits(instr_t);

  // ---- DRAM command ------------------------------------------------------
  typedef enum logic [2:0] {
    DR_NOP = 3'd0, DR_ACT = 3'd1, DR_RD = 3'd2, DR_WR = 3'd3, DR_PRE = 3'd4
  } dram_cmd_e;

endpackage : fugue_pkg
