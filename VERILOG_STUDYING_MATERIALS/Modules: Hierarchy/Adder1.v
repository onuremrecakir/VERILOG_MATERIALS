module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire [31:0] w1;
    wire w2;

    add16 add1 (.a(a[15:0]), .b (b[15:0]), .cin(1'b0), .sum(w1[15:0]), .cout(w2));
    add16 add2 (.a(a[31:16]), .b (b[31:16]), .cin(w2), .sum(w1[31:16]), .cout(1'b0));
    
    assign sum = w1;
    
endmodule


