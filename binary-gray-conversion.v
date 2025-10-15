`timescale 1ns / 1ps

module graycode(clk, sw, led, btn_g2b, btn_b2g, btn_rst);

input clk;
input [3:0] sw; // switch
input btn_g2b; // gray to binary
input btn_b2g;  // binary to gray
input btn_rst; // reset

output reg [3:0] led;

reg [3:0] tmp;

// converter // 
always @ (*)
begin
if (btn_rst)
    led = 4'b0000;            
else if (btn_b2g)  
    led = sw ^ (sw >> 1) ;          
else if (btn_g2b)
begin 
        led[3] = sw[3];
        led[2] = sw[2] ^ led[3];
        led[1] = sw[1] ^ led[2];
        led[0] = sw[0] ^ led[1];
end
else 
led = sw;
end
// converter # //

endmodule

/* 
NET "clk" LOC = "b8"; 

NET "sw<3>" LOC = "b4"; 
NET "sw<2>" LOC = "k3"; 
NET "sw<1>" LOC = "l3"; 
NET "sw<0>" LOC = "p11"; 

NET "btn_g2b" LOC = "a7"; 
NET "btn_b2g" LOC = "m4"; 
NET "btn_rst" LOC = "c11"; 
 
NET "led<3>" LOC = "p6" ; 
NET "led<2>" LOC = "p7" ; 
NET "led<1>" LOC = "m11" ; 
NET "led<0>" LOC = "m5" ; 

*/
