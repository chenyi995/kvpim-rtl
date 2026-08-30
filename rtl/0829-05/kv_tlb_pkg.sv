// kv_tlb_pkg.sv — parameters and types of the drampim-shaped KV segment TLB.
//
// Every physical constant mirrors attacc_drampim/src/workload_runner.py:
//   _HBM_TX_BYTES = 32            -> HBM_TX_BYTES
//   _HBM_CHANNEL_BYTES = 1 GiB    -> CH_SHIFT (16 channels -> 34-bit byte address)
//   _ORIGINAL_KV_GAP_BYTES = 8 MiB-> KV_GAP_SHIFT (value_base = key_base + 8 MiB)
//   bytes_per_vector = dhead*dbyte = 128*2 = 256 -> VEC_BYTES / STRIDE_SHIFT
//   CacheBlendTLB pools (master / diff channel sets) -> kind + ch_base/ch_count
//   CacheBlendTLB.scan_runs -> run_t (key_base, count, channel_base, channel_count)
//
// A TLB entry is one *segment descriptor* (= one drampim KVBlock as seen by
// one consumer context): a contiguous range of logical token positions
// [vpos_start, vpos_end) of context `ctx` at layer `layer` that lives in one
// contiguous physical run starting at key_base.  For a master segment
// count == vpos_end - vpos_start.  For a diff segment (drampim: diff block
// whose `rows` are the *sparse* corrected positions) the descriptor spans
// the corrected positions; count is the number of physically stored rows and
// the position->row map is the D_i bitmap prefix-popcount already held by
// diff_decoder, not by the TLB.
package kv_tlb_pkg;

  // ---- drampim physical geometry -------------------------------------
  localparam integer HBM_TX_BYTES = 32;
  localparam integer HBM_CHANNELS = 16;
  localparam integer CH_SHIFT     = 30;   // 1 GiB per channel
  localparam integer KV_GAP_SHIFT = 23;   // V = K + 8 MiB
  localparam integer VEC_BYTES    = 256;  // dhead 128 x FP16
  localparam integer STRIDE_SHIFT = 8;    // vector stride (32-B aligned) = 256 B
  localparam integer KV_ADDR_W      = 34;   // 16 ch x 1 GiB byte address

  // ---- logical identifiers ----------------------------------------------
  localparam integer CTX_W    = 8;   // request / agent id (batch member)
  localparam integer LAYER_W  = 7;   // decoder layer (ndec <= 128)
  localparam integer POS_W    = 16;  // logical token position
  localparam integer CNT_W    = 16;  // rows per segment (<= 8 MiB / 256 B)
  localparam integer CH_W     = 4;   // channel index
  localparam integer CHC_W    = 5;   // channel count 1..16
  localparam integer SEGCNT_W = 8;   // segments per (ctx, layer, kind) <= 255

  localparam logic KIND_MASTER = 1'b0;
  localparam logic KIND_DIFF   = 1'b1;

  // ---- table geometry ----------------------------------------------------
  localparam integer DESC_W     = 128;  // two descriptors per 32-B transaction
  localparam integer DIR_W      = 64;   // four directory entries per transaction
  localparam integer MEM_DATA_W = 8 * HBM_TX_BYTES;  // 256
  localparam integer KV_TLB_ENTRIES = 32;

  localparam integer DESC_PAD_W = DESC_W - (KV_ADDR_W + 2*POS_W + CNT_W + CTX_W +
                                                 LAYER_W + CH_W + CHC_W + 2);   // 20
  localparam integer DIR_PAD_W  = DIR_W - (KV_ADDR_W + SEGCNT_W + 1);        // 21

  // Segment descriptor (128 bits, MSB first).  Byte image in memory is
  // little-endian in 128-bit units: descriptor k of a segment array sits at
  // seg_base + 16*k; the even one is word[127:0], the odd one word[255:128].
  typedef struct packed {
    logic [DESC_PAD_W-1:0] pad;
    logic [KV_ADDR_W-1:0]    key_base;    // physical K byte address of row 0
    logic [POS_W-1:0]      vpos_start;  // first logical position covered
    logic [POS_W-1:0]      vpos_end;    // one past the last position covered
    logic [CNT_W-1:0]      count;       // physical rows in the run
    logic [CTX_W-1:0]      ctx;
    logic [LAYER_W-1:0]    layer;
    logic [CH_W-1:0]       ch_base;     // pool channel_base
    logic [CHC_W-1:0]      ch_count;    // pool channel_count
    logic                  kind;        // KIND_MASTER / KIND_DIFF
    logic                  valid;
  } seg_desc_t;

  // Bit offsets of the descriptor fields (LSB) — used where a struct view
  // cannot be indexed (per-entry match loops).
  localparam integer D_VALID_B  = 0;
  localparam integer D_KIND_B   = 1;
  localparam integer D_CHC_B    = 2;
  localparam integer D_CHB_B    = D_CHC_B    + CHC_W;    // 7
  localparam integer D_LAYER_B  = D_CHB_B    + CH_W;     // 11
  localparam integer D_CTX_B    = D_LAYER_B  + LAYER_W;  // 18
  localparam integer D_CNT_B    = D_CTX_B    + CTX_W;    // 26
  localparam integer D_VEND_B   = D_CNT_B    + CNT_W;    // 42
  localparam integer D_VSTART_B = D_VEND_B   + POS_W;    // 58
  localparam integer D_KEY_B    = D_VSTART_B + POS_W;    // 74

  // Directory entry (64 bits): one per (ctx, layer, kind), located at
  // dir_base + 8 * {ctx, layer, kind}.  Points at a 32-B aligned array of
  // seg_count descriptors sorted by vpos_start.
  typedef struct packed {
    logic [DIR_PAD_W-1:0]  pad;
    logic [KV_ADDR_W-1:0]    seg_base;
    logic [SEGCNT_W-1:0]   seg_count;
    logic                  valid;
  } dir_entry_t;

  // One physical run = one Ramulator job in drampim (_append_physical_pim_scan).
  typedef struct packed {
    logic [KV_ADDR_W-1:0] key_base;
    logic [CNT_W-1:0]   count;
    logic [CH_W-1:0]    ch_base;
    logic [CHC_W-1:0]   ch_count;
    logic               kind;
  } run_t;

  typedef enum logic [1:0] {
    OP_LOOKUP = 2'd0,   // one position  -> one run of `count` rows (cmd_pools selects the pool)
    OP_PLAN   = 2'd1,   // [pos_lo,pos_hi) -> coalesced run stream (cmd_pools: bit0 master, bit1 diff)
    OP_ATTACH = 2'd2,   // bulk-load every descriptor of (ctx, layer), both pools
    OP_FLUSH  = 2'd3    // invalidate the TLB
  } op_e;

  function automatic logic [KV_ADDR_W-1:0] dir_entry_addr(
      input logic [KV_ADDR_W-1:0] base,
      input logic [CTX_W-1:0]   ctx,
      input logic [LAYER_W-1:0] layer,
      input logic               kind);
    logic [KV_ADDR_W-1:0] idx;
    idx = {{(KV_ADDR_W-CTX_W-LAYER_W-1){1'b0}}, ctx, layer, kind};
    return base + (idx << 3);
  endfunction

  function automatic logic [KV_ADDR_W-1:0] value_base_of(input logic [KV_ADDR_W-1:0] key_base);
    return key_base + (KV_ADDR_W'(1) << KV_GAP_SHIFT);
  endfunction

endpackage
