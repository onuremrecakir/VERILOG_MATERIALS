`timescale 1ns / 1ps

module KEYPADNEW(clk, an, ld, row, col
    );
input clk;
input [3:0] col; 
output [3:0] row;
output [3:0] an;
output [6:0] ld; 

wire [25:0] timer1;
wire [3:0] keyout;


timer timer(.clk(clk), .counter(timer1));

kpadcontrol kpadcontrol(.clk(clk), .counter(timer1), .row(row), .col(col), .keyout(keyout));

ssegs ssegs(.clk(clk), .an(an), .ld(ld), .data(keyout), .counter(timer1));



endmodule
