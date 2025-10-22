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
/* ucf

NET "led<7>" LOC = "g1" ; 
NET "led<6>" LOC = "p4" ; 
NET "led<5>" LOC = "n4" ; 
NET "led<4>" LOC = "n5" ; 
NET "led<3>" LOC = "p6" ; 
NET "led<2>" LOC = "p7" ; 
NET "led<1>" LOC = "m11" ; 
NET "led<0>" LOC = "m5" ; 

NET "sw<7>" LOC = "n3"; 
NET "sw<6>" LOC = "e2"; 
NET "sw<5>" LOC = "f3"; 
NET "sw<4>" LOC = "g3"; 
NET "sw<3>" LOC = "b4"; 
NET "sw<2>" LOC = "k3"; 
NET "sw<1>" LOC = "l3"; 
NET "sw<0>" LOC = "p11"; 

*/
