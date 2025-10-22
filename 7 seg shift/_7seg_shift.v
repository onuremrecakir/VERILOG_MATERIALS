`timescale 1ns / 1ps

module _7seg_shift(sw, ld);

input [7:0] sw;
output reg [7:0] ld; 


reg [11:0] bcd_tmp;
reg [7:0] input_tmp;


integer i;

always @ (*)
begin
bcd_tmp = 12'b0;
input_tmp = sw;
for (i = 0; i < 8; i = i+1)
begin
   
    if (bcd_tmp [3:0] > 4)
       bcd_tmp [3:0] = bcd_tmp [3:0] + 4'b0011; //birler
       
    if (bcd_tmp [7:4] > 4)
        bcd_tmp [7:4] = bcd_tmp [7:4] + 4'b0011; //onlar
    
    if (bcd_tmp [11:8] > 4)
        bcd_tmp [11:8] = bcd_tmp [11:8] + 4'b0011; //yuzler
     
        bcd_tmp = {bcd_tmp [10:0], input_tmp [7]};
        input_tmp = input_tmp << 1;
end

ld = 8'b0;

end

endmodule
