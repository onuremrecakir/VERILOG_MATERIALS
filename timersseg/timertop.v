`timescale 1ns / 1ps

module timertop(clk, sw, btn, an, ld, dp
    );

input clk;
input [7:0] sw;
input [1:0] btn;

output [3:0] an;
output [6:0] ld;
output dp;

///////////////////////

wire [11:0] mins_bridge, secs_bridge;
wire [5:0] minute_bridge, second_bridge;

/////////
clock clock (.clk(clk),
				 .sw(sw),
				 .btn(btn),
				 .minute(minute_bridge),
				 .second(second_bridge)
				 );
				 
sseg sseg (.clk(clk),
			  .mins(mins_bridge),
			  .secs(secs_bridge),
			  .ld(ld),
			  .an(an),
			  .dp(dp)
			 );
			 
bcd bcd (.bcd_in(minute_bridge),
			.bcdo(mins_bridge),
			.bcd_ins(second_bridge),
			.bcdos(secs_bridge)
			);

///////////
endmodule
