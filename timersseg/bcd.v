`timescale 1ns / 1ps

module bcd(bcd_in, bcdo, bcd_ins, bcdos);

//// i/o for minute ////
input [7:0] bcd_in; 
output reg [11:0] bcdo; 
////////////////////////

//// i/o for second ////
input [7:0] bcd_ins;
output reg [11:0] bcdos; 
////////////////////////



reg [11:0] bcd_tmp;  // min
reg [7:0] input_tmp; // min

reg [11:0] bcds_tmp; // sec
reg [7:0] inputs_tmp; // sec

integer i;


////// bcd for minute ///////
always @ (*)
begin
bcd_tmp = 12'b0;
input_tmp = bcd_in;
for (i = 0; i < 8; i = i+1)
begin
   
    if (bcd_tmp [3:0] > 4)
       bcd_tmp [3:0] = bcd_tmp [3:0] + 4'b0011; //ones
       
    if (bcd_tmp [7:4] > 4)
        bcd_tmp [7:4] = bcd_tmp [7:4] + 4'b0011; //tens
    
    if (bcd_tmp [11:8] > 4)
        bcd_tmp [11:8] = bcd_tmp [11:8] + 4'b0011; //hundreds
     
        bcd_tmp = {bcd_tmp [10:0], input_tmp [7]};
        input_tmp = input_tmp << 1;
end

bcdo = bcd_tmp; 

end



///////// bcd for sec ////////
always @ (*)
begin
bcds_tmp = 12'b0;
inputs_tmp = bcd_ins;
for (i = 0; i < 8; i = i+1)
begin
   
    if (bcds_tmp [3:0] > 4)
       bcds_tmp [3:0] = bcds_tmp [3:0] + 4'b0011; //ones
       
    if (bcds_tmp [7:4] > 4)
        bcds_tmp [7:4] = bcds_tmp [7:4] + 4'b0011; //tens
    
    if (bcds_tmp [11:8] > 4)
        bcds_tmp [11:8] = bcds_tmp [11:8] + 4'b0011; //hundreds
     
        bcds_tmp = {bcds_tmp [10:0], inputs_tmp [7]};
        inputs_tmp = inputs_tmp << 1;
		  
end

bcdos = bcds_tmp; 

end


endmodule