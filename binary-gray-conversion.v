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
