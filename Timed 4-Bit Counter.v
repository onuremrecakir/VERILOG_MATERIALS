module led_blink (clk, rst, led);

input clk;
reg [25:0] time_counter;
output reg [3:0] led;
input rst; 

always @ (posedge clk or posedge rst)
begin

if (rst)
begin
time_counter <= 26'b0;
led <= 4'b0;
end
else if (time_counter == 49_999_999)
begin 
    time_counter <= 26'b0;
    led <= led + 1'b1;
end
else
time_counter <= time_counter + 1'b1;
end

endmodule
