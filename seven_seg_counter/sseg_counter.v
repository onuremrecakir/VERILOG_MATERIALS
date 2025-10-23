`timescale 1ns / 1ps

module sseg_counter(clk, sw1, ld1, rst, ld, an);
//////////////////////////////
input clk;
input sw1; 
input rst;

output ld1;
output  [6:0] ld;
output  [3:0] an;

wire [11:0] bcd_result; // dec value from bcd.v 

assign ld1 = sw1;
////////////////////////////////
reg [26:0] counter50 = 0; //50_000_000 counter
reg [7:0] counter1; // count to 255 
///////////////////////////////


//1 sec counter up to 255 // 
always @ (posedge clk or posedge rst)
begin
if (rst)
begin
    counter50 <= 0;
    counter1 <= 0;
end
    else
    begin
        if (counter50 == 50_000_000) // **** adjust number for counting speed **** 50_000_000 = 1 sec
            begin
            counter50 <= 0;
            counter1 <= sw1 ? (counter1 + 1) : (counter1 - 1);
            end
        else
            counter50 <= counter50 + 1;
        end
    end
//1 sec counter up to 255#// 


_7seg_shift bcd (
    .bcd_in(counter1),          // send 8 bit binary 
    .bcd(bcd_result)     // recieve 12 bit BCD 
);


sseg sseg (.decimals(bcd_result),
           .clk(clk),
           .ld(ld),
           .an(an)

);




/* 
bcd +
7-seg +
1sec counter +
counter changes direction + 

*/


endmodule
