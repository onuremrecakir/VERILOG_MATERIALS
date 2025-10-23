`timescale 1ns / 1ps

module sseg(clk, decimals, ld, an);

input clk; 
input [11:0] decimals; 

output reg [6:0] ld;
output reg [3:0] an;

parameter n = 18; // referesh of 7 seg
reg [n:0] counter;
reg [3:0] sseg;

always @ (posedge clk)
begin
counter <= counter + 1;
end

always @ (*)
begin
case (counter[n:n-1])
    2'b00:
        begin
        sseg = decimals [3:0]; // ones
        an = 4'b1110;
        end
    2'b01:
        begin
        sseg = decimals [7:4]; // tens
        an = 4'b1101;
        end
    2'b10:
        begin
        sseg = decimals [11:8]; // hundreds 
        an = 4'b1011;
        end
    2'b11:
        begin
        sseg = 4'b0000; // thousands '0' since 4th digit is impossible
        an = 4'b0111;
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
        default: ld = 7'b1111111; //  better to use
        endcase
end




endmodule
