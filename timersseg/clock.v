`timescale 1ns / 1ps

module clock(clk, sw, btn, minute, second
    );



input clk;
input [7:0] sw;
input [1:0] btn;



output reg [5:0] minute, second; 
reg [5:0] minute_tmp, second_tmp;
reg [0:0] btn_pressed;

reg [25:0] count;  
reg [0:0] onesec;




always @ (posedge clk)
begin

if (count == 50_000_000) begin
count <= 0;
onesec <= 1'b1; end
else begin
count <= count + 1;
onesec <= 1'b0; end

end




always @ (posedge clk)
begin

	if (btn[1] == 1'b1) btn_pressed <= 1'b1;
	if (btn[0] == 1'b1) btn_pressed <= 1'b0;

	if (!btn_pressed) begin 

	minute_tmp [3:0] <= sw [7:4];
	second_tmp [3:0] <= sw [3:0];

	end

end


always @ (posedge onesec)
begin

minute <= minute_tmp;
second <= second_tmp;
	if (btn_pressed) begin
	
		if (minute == 0 && second == 0) begin
		minute <= 0; 
		second <= 0; end
		
		else if (second == 0) begin
		minute <= minute - 1;
		second <= 59; end
		
		else begin
		second <= second - 1;
		minute <= minute; end
		
	end

end



endmodule
