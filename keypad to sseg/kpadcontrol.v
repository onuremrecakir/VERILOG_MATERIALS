`timescale 1ns / 1ps

module kpadcontrol(clk, counter, row, col, keyout
    );

input clk;
input [25:0] counter; 
input wire [3:0] col;

output reg [3:0] row;
output reg [3:0] keyout = 4'b0000; 

reg [3:0] keyout_next;
reg [3:0] row_scan;


/////////////// NOT MY WORK //////
parameter LAG = 10;                   // 50MHz / 10 = 5M -> 1/5M = 200ns

reg [19:0] scan_timer = 0;           
reg [1:0] col_select = 0; 

always @(posedge clk)          
	if(scan_timer == 99_999) begin   
		scan_timer <= 0;
		col_select <= col_select + 1;
	end
	else
		scan_timer <= scan_timer + 1;
/////////////// NOT MY WORK //////


always @ (*)
begin

row_scan = 4'b1111;
keyout_next = keyout; 

case (col_select) 

	2'b00: begin 
	row_scan = 4'b1110;
	
		 if(scan_timer == LAG) begin
			case (col)
			4'b1110: keyout_next = 4'h00;
			4'b1101: keyout_next = 4'h01;
			4'b1011: keyout_next = 4'h02;
			4'b0111: keyout_next = 4'h03;
			default: keyout_next = keyout; // Keep previous value
			endcase
		end
		end
	2'b01: begin

	row_scan = 4'b1101;
	 
		 if(scan_timer == LAG) begin
			case (col)
			4'b1110: keyout_next = 4'h04;
			4'b1101: keyout_next = 4'h05;
			4'b1011: keyout_next = 4'h06;
			4'b0111: keyout_next = 4'h07;
			default: keyout_next = keyout; // Keep previous value
			endcase
		end
	
	end
	2'b10: begin 
	row_scan = 4'b1011;
	 
		 if(scan_timer == LAG) begin
			case (col)
			4'b1110: keyout_next = 4'h08;
			4'b1101: keyout_next = 4'h09;
			4'b1011: keyout_next = 4'hA;
			4'b0111: keyout_next = 4'hB;
			default: keyout_next = keyout; // Keep previous value
			endcase
		end
		end
	2'b11: begin
	row_scan = 4'b0111;
	
		 if(scan_timer == LAG) begin
			case (col)
			4'b1110: keyout_next = 4'hC;
			4'b1101: keyout_next = 4'hD;
			4'b1011: keyout_next = 4'hE;
			4'b0111: keyout_next = 4'hF;
			default: keyout_next = keyout; // Keep previous value
			endcase
		end
		end
	
	endcase
end

always @ (posedge clk) //kind of memory
begin
	row <= row_scan;
	keyout <= keyout_next;
end






endmodule