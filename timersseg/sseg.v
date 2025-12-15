`timescale 1ns / 1ps

module sseg(clk, mins, secs, ld, an, dp);

input clk; 
input [11:0] mins;
input [11:0] secs;

output reg [6:0] ld;
output reg [3:0] an;
output reg [0:0] dp;

reg [18:0] counter;
reg [3:0] sseg;



always @ (posedge clk)
begin
counter <= counter + 1;
end

always @ (posedge clk)
begin

case (counter[18:17])
    2'b00:
        begin
        sseg = secs [3:0]; 
        an = 4'b1110;
		  dp = 1'b1;
        end
    2'b01:
        begin
        sseg = secs [7:4]; 
        an = 4'b1101;
		  dp = 1'b1;
        end
    2'b10:
        begin
        sseg = mins [3:0];  
        an = 4'b1011;
		  dp = 1'b0;
        end
    2'b11:
        begin
        sseg = mins [7:4];  
        an = 4'b0111;
		  dp = 1'b1;
        end
endcase
end

always @ (*)
begin
case(sseg)
        4'b0000: ld = 7'b0000001; // "0"     
        4'b0001: ld = 7'b1001111; // "1" 
        4'b0010: ld = 7'b0010010; // "2" 
        4'b0011: ld = 7'b0000110; // "3" 
        4'b0100: ld = 7'b1001100; // "4" 
        4'b0101: ld = 7'b0100100; // "5" 
        4'b0110: ld = 7'b0100000; // "6" 
        4'b0111: ld = 7'b0001111; // "7" 
        4'b1000: ld = 7'b0000000; // "8"     
        4'b1001: ld = 7'b0000100; // "9"
		  4'b1010: ld = 7'b0001000; // "A"
		  4'b1011: ld = 7'b1100000; // "b"
		  4'b1100: ld = 7'b0110001; // "C"
		  4'b1101: ld = 7'b1000010; // "d"
		  4'b1110: ld = 7'b0110000; // "E"
		  4'b1111: ld = 7'b0111000; // "F"
        default: ld = 7'b1111111; //  better to use
        endcase
end


endmodule