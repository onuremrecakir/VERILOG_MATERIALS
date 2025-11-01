`timescale 1ns / 1ps

module timer(clk, counter
    );

input clk;
output reg [25:0] counter; 

always @ (posedge clk)
begin 
if (counter == 50_000_000)
begin 
counter <= 0;
end
else begin
counter <= counter + 1; 
end

end


endmodule
