// tb_kv_tlb.sv — drives kv_tlb_top against the page-table image and the
// expected vectors produced by testbench/gen_kv_tlb_vectors.py from drampim's
// CacheBlendTLB, and reports TLB / PTW / planner cycle counts.
//
//   +vec=<dir>     vector directory (default testbench/vectors/kv_tlb/, i.e. run from the repo root)
//   MEM_LAT        cycles between a memory request handshake and its
//                  response (>= 1).  The memory itself is not the object of
//                  study: "logic" cycles = cycles - MEM_LAT * reads.
`timescale 1ns/1ps
module tb_kv_tlb;
    import kv_tlb_pkg::*;
    parameter integer MEM_LAT   = 1;
    parameter integer MEM_WORDS = 2048;
    parameter integer ENTRIES   = 32;

    logic clk = 1'b0;
    always #1 clk = ~clk;                       // 500 MHz
    logic rst_n = 1'b0;

    // ---- DUT ----
    logic                  cmd_valid, cmd_ready, cmd_done, cmd_fault;
    logic [1:0]            cmd_op, cmd_pools;
    logic [CTX_W-1:0]      cmd_ctx;
    logic [LAYER_W-1:0]    cmd_layer;
    logic [POS_W-1:0]      cmd_pos_lo, cmd_pos_hi;
    logic                  run_valid, run_ready;
    run_t                  run;
    logic [KV_ADDR_W-1:0]    run_value_base;
    logic                  mem_req_valid, mem_req_ready, mem_resp_valid;
    logic [KV_ADDR_W-1:0]    mem_req_addr;
    logic [MEM_DATA_W-1:0] mem_resp_data;

    kv_tlb_top #(.ENTRIES(ENTRIES)) dut (
        .clk(clk), .rst_n(rst_n), .cfg_dir_base({KV_ADDR_W{1'b0}}),
        .cmd_valid(cmd_valid), .cmd_ready(cmd_ready), .cmd_op(cmd_op), .cmd_ctx(cmd_ctx),
        .cmd_layer(cmd_layer), .cmd_pos_lo(cmd_pos_lo), .cmd_pos_hi(cmd_pos_hi), .cmd_pools(cmd_pools),
        .cmd_done(cmd_done), .cmd_fault(cmd_fault),
        .run_valid(run_valid), .run_ready(run_ready), .run(run), .run_value_base(run_value_base),
        .mem_req_valid(mem_req_valid), .mem_req_ready(mem_req_ready), .mem_req_addr(mem_req_addr),
        .mem_resp_valid(mem_resp_valid), .mem_resp_data(mem_resp_data)
    );

    // ---- memory model: single outstanding 32-B read ----
    logic [MEM_DATA_W-1:0] mem [0:MEM_WORDS-1];
    logic                  pend = 1'b0;
    logic [KV_ADDR_W-1:0]    pend_addr;
    integer                lat_cnt;
    integer                mem_reads = 0;
    assign mem_req_ready = !pend;
    always @(posedge clk) begin
        mem_resp_valid <= 1'b0;
        if (pend) begin
            if (lat_cnt <= 1) begin
                mem_resp_valid <= 1'b1;
                mem_resp_data  <= mem[pend_addr >> 5];
                pend           <= 1'b0;
            end else lat_cnt <= lat_cnt - 1;
        end else if (mem_req_valid) begin
            pend <= 1'b1; pend_addr <= mem_req_addr; lat_cnt <= MEM_LAT; mem_reads = mem_reads + 1;
            if ((mem_req_addr >> 5) >= MEM_WORDS) $fatal(1, "memory address out of image: %h", mem_req_addr);
        end
    end

    // ---- run capture ----
    assign run_ready = 1'b1;
    integer             ngot = 0;
    logic [KV_ADDR_W-1:0] got_key [0:255];
    logic [CNT_W-1:0]   got_cnt [0:255];
    logic [CH_W-1:0]    got_chb [0:255];
    logic [CHC_W-1:0]   got_chc [0:255];
    logic               got_kind[0:255];
    always @(posedge clk) if (run_valid && run_ready) begin
        got_key[ngot] = run.key_base; got_cnt[ngot] = run.count; got_chb[ngot] = run.ch_base;
        got_chc[ngot] = run.ch_count; got_kind[ngot] = run.kind; ngot = ngot + 1;
        if (run_value_base != run.key_base + (34'd1 << KV_GAP_SHIFT)) $fatal(1, "value_base mismatch");
    end

    integer cycles = 0;
    always @(posedge clk) cycles = cycles + 1;
    integer errors = 0;

    // ---- internal probes: raw TLB lookup latency and PTW walk cycles ----
    integer tlb_lk_issue = -1, tlb_lk_lat_min = 1<<30, tlb_lk_lat_max = 0, tlb_lk_n = 0;
    integer walk_start = -1, walk_rd0 = 0, walk_attach_r = 0;
    integer ptw_dem_n = 0, ptw_dem_cyc = 0, ptw_dem_rd = 0, ptw_dem_min = 1<<30, ptw_dem_max = 0;
    integer ptw_at_n = 0, ptw_at_cyc = 0, ptw_at_rd = 0, ptw_at_min = 1<<30, ptw_at_max = 0;
    integer plan_start = -1, plan_lat_n = 0, plan_lat_cyc = 0;
    always @(posedge clk) begin
        if (dut.u_tlb.lk_valid) tlb_lk_issue = cycles;
        if (dut.u_tlb.lk_resp_valid && tlb_lk_issue >= 0) begin
            tlb_lk_n++;
            if (cycles - tlb_lk_issue < tlb_lk_lat_min) tlb_lk_lat_min = cycles - tlb_lk_issue;
            if (cycles - tlb_lk_issue > tlb_lk_lat_max) tlb_lk_lat_max = cycles - tlb_lk_issue;
        end
        if (dut.u_ptw.walk_valid && dut.u_ptw.walk_ready) begin
            walk_start = cycles; walk_rd0 = mem_reads; walk_attach_r = dut.u_ptw.walk_attach;
        end
        if (dut.u_ptw.walk_done && walk_start >= 0) begin
            if (walk_attach_r) begin
                ptw_at_n++; ptw_at_cyc += cycles - walk_start; ptw_at_rd += mem_reads - walk_rd0;
                if (cycles - walk_start < ptw_at_min) ptw_at_min = cycles - walk_start;
                if (cycles - walk_start > ptw_at_max) ptw_at_max = cycles - walk_start;
            end else begin
                ptw_dem_n++; ptw_dem_cyc += cycles - walk_start; ptw_dem_rd += mem_reads - walk_rd0;
                if (cycles - walk_start < ptw_dem_min) ptw_dem_min = cycles - walk_start;
                if (cycles - walk_start > ptw_dem_max) ptw_dem_max = cycles - walk_start;
            end
            walk_start = -1;
        end
    end

    // cycles = posedges from the accept edge (exclusive) to the edge that
    // raises cmd_done (inclusive); reads = memory requests in between.
    task automatic do_cmd(input [1:0] op, input [CTX_W-1:0] ctx, input [LAYER_W-1:0] layer,
                          input [POS_W-1:0] lo, input [POS_W-1:0] hi, input [1:0] pools,
                          output integer ncyc, output integer nrd, output logic fault);
        integer c0, r0;
        @(negedge clk);
        while (!cmd_ready) @(negedge clk);
        cmd_valid = 1'b1; cmd_op = op; cmd_ctx = ctx; cmd_layer = layer;
        cmd_pos_lo = lo; cmd_pos_hi = hi; cmd_pools = pools; ngot = 0;
        @(negedge clk);                      // accepted at the preceding posedge
        cmd_valid = 1'b0; c0 = cycles; r0 = mem_reads;
        while (!cmd_done) @(negedge clk);
        ncyc = cycles - c0; nrd = mem_reads - r0; fault = cmd_fault;
    endtask

    // ---- statistics ----
    integer lk_hit_n = 0, lk_hit_cyc = 0, lk_hit_min = 1<<30, lk_hit_max = 0;
    integer lk_miss_n = 0, lk_miss_cyc = 0, lk_miss_rd = 0, lk_miss_min = 1<<30, lk_miss_max = 0, lk_miss_rdmax = 0;
    integer at_n = 0, at_cyc = 0, at_rd = 0;
    integer pl_cold_n = 0, pl_cold_cyc = 0, pl_cold_rd = 0, pl_cold_runs = 0;
    integer pl_warm_n = 0, pl_warm_cyc = 0, pl_warm_runs = 0, pl_warm_min = 1<<30, pl_warm_max = 0;

    string  vec_dir;
    integer fd, rc;
    integer v_ctx, v_layer, v_pool, v_pos, v_fault, v_cnt, v_chb, v_chc, v_lo, v_hi, v_pools, v_nruns;
    logic [KV_ADDR_W-1:0] v_key;
    logic [KV_ADDR_W-1:0] e_key [0:255];
    integer e_cnt [0:255], e_chb [0:255], e_chc [0:255], e_kind [0:255];
    integer nc, nr, i, last_ctx, last_layer;
    logic   f;

    initial begin
        if (!$value$plusargs("vec=%s", vec_dir)) vec_dir = "testbench/vectors/kv_tlb/";
        for (i = 0; i < MEM_WORDS; i++) mem[i] = '0;
        $readmemh({vec_dir, "table.hex"}, mem);
        cmd_valid = 1'b0; cmd_op = '0; cmd_ctx = '0; cmd_layer = '0; cmd_pos_lo = '0; cmd_pos_hi = '0; cmd_pools = '0;
        repeat (3) @(negedge clk);
        rst_n = 1'b1;
        repeat (2) @(negedge clk);

        // ================= lookups =================
        fd = $fopen({vec_dir, "lookups.txt"}, "r");
        if (fd == 0) $fatal(1, "cannot open lookups.txt");
        last_ctx = -1; last_layer = -1;
        while ($fscanf(fd, "%d %d %d %d %d %h %d %d %d\n", v_ctx, v_layer, v_pool, v_pos, v_fault,
                       v_key, v_cnt, v_chb, v_chc) == 9) begin
            if (v_ctx != last_ctx || v_layer != last_layer) begin
                do_cmd(OP_FLUSH, 0, 0, 0, 0, 0, nc, nr, f);     // cold per (ctx, layer)
                last_ctx = v_ctx; last_layer = v_layer;
            end
            if (v_pool == 2) begin                            // diff descriptors are attach-only
                do_cmd(OP_ATTACH, v_ctx, v_layer, 0, 0, 0, nc, nr, f);
            end
            // first access (may miss), second access (must hit)
            do_cmd(OP_LOOKUP, v_ctx, v_layer, v_pos, 0, v_pool, nc, nr, f);
            if (f != v_fault[0]) begin
                errors++; $display("FAIL lookup ctx=%0d L=%0d pool=%0d pos=%0d: fault=%0d expected %0d", v_ctx, v_layer, v_pool, v_pos, f, v_fault);
            end else if (!f) begin
                if (ngot != 1 || got_key[0] !== v_key || got_cnt[0] != v_cnt || got_chb[0] != v_chb || got_chc[0] != v_chc) begin
                    errors++; $display("FAIL lookup ctx=%0d L=%0d pool=%0d pos=%0d: got n=%0d key=%h cnt=%0d ch=%0d/%0d expected key=%h cnt=%0d ch=%0d/%0d",
                                       v_ctx, v_layer, v_pool, v_pos, ngot, got_key[0], got_cnt[0], got_chb[0], got_chc[0], v_key, v_cnt, v_chb, v_chc);
                end
                if (nr > 0) begin
                    lk_miss_n++; lk_miss_cyc += nc; lk_miss_rd += nr;
                    if (nc < lk_miss_min) lk_miss_min = nc; if (nc > lk_miss_max) lk_miss_max = nc;
                    if (nr > lk_miss_rdmax) lk_miss_rdmax = nr;
                end
                do_cmd(OP_LOOKUP, v_ctx, v_layer, v_pos, 0, v_pool, nc, nr, f);
                if (f || nr != 0 || ngot != 1 || got_key[0] !== v_key) begin
                    errors++; $display("FAIL re-lookup ctx=%0d L=%0d pool=%0d pos=%0d: fault=%0d reads=%0d", v_ctx, v_layer, v_pool, v_pos, f, nr);
                end
                lk_hit_n++; lk_hit_cyc += nc;
                if (nc < lk_hit_min) lk_hit_min = nc; if (nc > lk_hit_max) lk_hit_max = nc;
            end
        end
        $fclose(fd);

        // ================= plans =================
        fd = $fopen({vec_dir, "plans.txt"}, "r");
        if (fd == 0) $fatal(1, "cannot open plans.txt");
        while ($fscanf(fd, "%d %d %d %d %d %d\n", v_ctx, v_layer, v_lo, v_hi, v_pools, v_nruns) == 6) begin
            for (i = 0; i < v_nruns; i++) begin
                rc = $fscanf(fd, "%h %d %d %d %d\n", e_key[i], e_cnt[i], e_chb[i], e_chc[i], e_kind[i]);
                if (rc != 5) $fatal(1, "bad plans.txt");
            end
            do_cmd(OP_FLUSH, 0, 0, 0, 0, 0, nc, nr, f);
            if (v_pools[1]) begin
                do_cmd(OP_ATTACH, v_ctx, v_layer, 0, 0, 0, nc, nr, f);
                at_n++; at_cyc += nc; at_rd += nr;
                if (f) begin errors++; $display("FAIL attach ctx=%0d L=%0d faulted", v_ctx, v_layer); end
            end
            do_cmd(OP_PLAN, v_ctx, v_layer, v_lo, v_hi, v_pools, nc, nr, f);
            if (f) begin errors++; $display("FAIL plan ctx=%0d L=%0d [%0d,%0d) pools=%0d faulted", v_ctx, v_layer, v_lo, v_hi, v_pools); end
            if (ngot != v_nruns) begin
                errors++; $display("FAIL plan ctx=%0d L=%0d [%0d,%0d) pools=%0d: %0d runs, expected %0d", v_ctx, v_layer, v_lo, v_hi, v_pools, ngot, v_nruns);
            end else for (i = 0; i < v_nruns; i++) begin
                if (got_key[i] !== e_key[i] || got_cnt[i] != e_cnt[i] || got_chb[i] != e_chb[i] ||
                    got_chc[i] != e_chc[i] || got_kind[i] != e_kind[i][0]) begin
                    errors++; $display("FAIL plan ctx=%0d L=%0d run %0d: got %h/%0d/%0d/%0d/%0d expected %h/%0d/%0d/%0d/%0d",
                                       v_ctx, v_layer, i, got_key[i], got_cnt[i], got_chb[i], got_chc[i], got_kind[i],
                                       e_key[i], e_cnt[i], e_chb[i], e_chc[i], e_kind[i]);
                end
            end
            if (v_pools[1]) begin
                pl_warm_n++; pl_warm_cyc += nc; pl_warm_runs += v_nruns;
                if (nc < pl_warm_min) pl_warm_min = nc; if (nc > pl_warm_max) pl_warm_max = nc;
                if (nr != 0) begin errors++; $display("FAIL plan after attach read memory (%0d reads)", nr); end
            end else begin
                pl_cold_n++; pl_cold_cyc += nc; pl_cold_rd += nr; pl_cold_runs += v_nruns;
                // warm repeat: every segment resident now
                do_cmd(OP_PLAN, v_ctx, v_layer, v_lo, v_hi, v_pools, nc, nr, f);
                if (f || nr != 0 || ngot != v_nruns) begin errors++; $display("FAIL warm plan ctx=%0d L=%0d", v_ctx, v_layer); end
                pl_warm_n++; pl_warm_cyc += nc; pl_warm_runs += v_nruns;
                if (nc < pl_warm_min) pl_warm_min = nc; if (nc > pl_warm_max) pl_warm_max = nc;
            end
            $display("plan ctx=%0d L=%0d [%0d,%0d) pools=%0d runs=%0d : %s warm cycles=%0d", v_ctx, v_layer, v_lo, v_hi, v_pools, v_nruns,
                     v_pools[1] ? "attached " : "cold+warm", nc);
        end
        $fclose(fd);

        // ================= summary =================
        $display("---- tb_kv_tlb summary (ENTRIES=%0d, MEM_LAT=%0d, 500 MHz clock) ----", ENTRIES, MEM_LAT);
        $display("TLB lookup   : request -> response %0d..%0d cycles (n=%0d)", tlb_lk_lat_min, tlb_lk_lat_max, tlb_lk_n);
        $display("PTW demand   : n=%0d  cycles avg %0.1f  min %0d  max %0d  reads avg %0.2f  logic-only avg %0.1f  (walk accept -> done)",
                 ptw_dem_n, ptw_dem_n ? real'(ptw_dem_cyc)/ptw_dem_n : 0.0, ptw_dem_min, ptw_dem_max,
                 ptw_dem_n ? real'(ptw_dem_rd)/ptw_dem_n : 0.0, ptw_dem_n ? real'(ptw_dem_cyc - MEM_LAT*ptw_dem_rd)/ptw_dem_n : 0.0);
        $display("PTW attach   : n=%0d  cycles avg %0.1f  min %0d  max %0d  reads avg %0.2f  logic-only avg %0.1f  (both pools of (ctx,layer))",
                 ptw_at_n, ptw_at_n ? real'(ptw_at_cyc)/ptw_at_n : 0.0, ptw_at_min, ptw_at_max,
                 ptw_at_n ? real'(ptw_at_rd)/ptw_at_n : 0.0, ptw_at_n ? real'(ptw_at_cyc - MEM_LAT*ptw_at_rd)/ptw_at_n : 0.0);
        $display("-- command-level (includes top/planner framing) --");
        $display("lookup hit   : n=%0d  cycles avg %0.1f  min %0d  max %0d  (command accept -> done, 0 memory reads)",
                 lk_hit_n, lk_hit_n ? real'(lk_hit_cyc)/lk_hit_n : 0.0, lk_hit_min, lk_hit_max);
        $display("lookup miss  : n=%0d  cycles avg %0.1f  min %0d  max %0d  reads avg %0.2f max %0d  logic-only avg %0.1f",
                 lk_miss_n, lk_miss_n ? real'(lk_miss_cyc)/lk_miss_n : 0.0, lk_miss_min, lk_miss_max,
                 lk_miss_n ? real'(lk_miss_rd)/lk_miss_n : 0.0, lk_miss_rdmax,
                 lk_miss_n ? real'(lk_miss_cyc - MEM_LAT*lk_miss_rd)/lk_miss_n : 0.0);
        $display("attach       : n=%0d  cycles avg %0.1f  reads avg %0.2f  logic-only avg %0.1f",
                 at_n, at_n ? real'(at_cyc)/at_n : 0.0, at_n ? real'(at_rd)/at_n : 0.0,
                 at_n ? real'(at_cyc - MEM_LAT*at_rd)/at_n : 0.0);
        $display("plan cold    : n=%0d  cycles avg %0.1f  reads avg %0.2f  runs avg %0.2f",
                 pl_cold_n, pl_cold_n ? real'(pl_cold_cyc)/pl_cold_n : 0.0, pl_cold_n ? real'(pl_cold_rd)/pl_cold_n : 0.0,
                 pl_cold_n ? real'(pl_cold_runs)/pl_cold_n : 0.0);
        $display("plan warm    : n=%0d  cycles avg %0.1f  min %0d  max %0d  runs avg %0.2f  -> %0.1f cycles/run (drampim charges 5 ns = 2.5 cycles/run)",
                 pl_warm_n, pl_warm_n ? real'(pl_warm_cyc)/pl_warm_n : 0.0, pl_warm_min, pl_warm_max,
                 pl_warm_n ? real'(pl_warm_runs)/pl_warm_n : 0.0, pl_warm_runs ? real'(pl_warm_cyc)/pl_warm_runs : 0.0);
        if (errors == 0) $display("PASS tb_kv_tlb");
        else $fatal(1, "FAIL tb_kv_tlb: %0d errors", errors);
        $finish;
    end
endmodule
