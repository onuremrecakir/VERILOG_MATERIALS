`timescale 1ns / 1ps

module _3bit_adder_s(sw, led);

input [7:0] sw;
output [7:0] led;

wire select_display = sw[7];
wire [2:0] num1 = sw[2:0];
wire [2:0] num2 = sw[5:3];
wire [3:0] sum  = num1 + num2;

assign led = (select_display == 1'b1) ? {num2, num1} : {4'b0000, sum};

endmodule
