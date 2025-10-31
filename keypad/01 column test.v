// Different leds turn on depending on pressed column. All keys have effect // 

module keypadtop(clk, row, column, ld
    );

input clk;
input wire [3:0] column;
output reg [3:0] row;
output reg [4:0] ld;

always @ (posedge clk)
begin
row = 4'b0000;
/*if (row [3:0] == 4'b0000) 
begin
ld [0] = 1'b0;
end
else 
begin
ld [0] = 1'b1;
end*/
ld = 5'b00000;
casez (column)
		
		4'bzzz0: ld [3] = 1'b1;
		4'bzz0z: ld [2] = 1'b1;
		4'bz0zz: ld [1] = 1'b1;
		4'b0zzz: ld [0] = 1'b1;
		default : ld [4] = 1'b1;
		endcase

/*
if (column [3:0] == 4'b0000) 
begin
ld [1:0] = 2'b00;
end
else 
begin
ld [1:0] = 2'b11;
end
*/

end
endmodule
