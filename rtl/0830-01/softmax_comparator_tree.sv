// Standalone registered 16-lane FP32 max tree used by softmax_unit.
module softmax_comparator_tree (
    input logic clk, rst_n, in_valid,
    input logic [15:0][31:0] in_data,
    output logic out_valid, output logic [31:0] out_max
);
    function automatic logic gt(input logic [31:0] a, input logic [31:0] b);
        logic sa,sb; logic [30:0] ma,mb;
        begin
            sa=a[31]; sb=b[31]; ma=a[30:0]; mb=b[30:0];
            if (sa!=sb) gt=((ma!=0||mb!=0)&&!sa);
            else if (!sa) gt=(ma>mb);
            else gt=(ma<mb);
        end
    endfunction
    logic [31:0] l1[8],l2[4],l3[2];
    logic v1,v2,v3;
    integer i;
    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            v1<=0;v2<=0;v3<=0;out_valid<=0;out_max<=0;
            for(i=0;i<8;i++)l1[i]<=0;
            for(i=0;i<4;i++)l2[i]<=0;
            for(i=0;i<2;i++)l3[i]<=0;
        end else begin
            for(i=0;i<8;i++) l1[i]<=gt(in_data[2*i],in_data[2*i+1])?in_data[2*i]:in_data[2*i+1];
            for(i=0;i<4;i++) l2[i]<=gt(l1[2*i],l1[2*i+1])?l1[2*i]:l1[2*i+1];
            for(i=0;i<2;i++) l3[i]<=gt(l2[2*i],l2[2*i+1])?l2[2*i]:l2[2*i+1];
            out_max<=gt(l3[0],l3[1])?l3[0]:l3[1];
            v1<=in_valid;v2<=v1;v3<=v2;out_valid<=v3;
        end
    end
endmodule
