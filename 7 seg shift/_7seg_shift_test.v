`timescale 1ns / 1ps

module _7seg_shift_test;

    // reg clk;  <-- 1. REMOVE THIS (it's unused)
    reg [7:0] sw;
    wire [11:0] ld;  // <-- 2. FIX THIS (must be 11:0)

    _7seg_shift uut (.sw(sw), .ld(ld));

    initial begin
        sw = 8'b10101010;
        #1000;
        $finish;
    end

endmodule
