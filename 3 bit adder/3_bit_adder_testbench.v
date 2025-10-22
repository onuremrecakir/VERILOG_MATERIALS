`timescale 1ns / 1ps

module test;

reg [7:0] sw;
wire [7:0] led;



_3bit_adder_s uut (.sw(sw),
                   .led(led)
);

initial begin
sw = 8'b00000000;

#10;

sw [2:0] = 3'b101; //4
sw [5:3] = 3'b001; //1

#10;

sw[7] = 1'b1;

#10;

sw[7] = 1'b0;

#10;

sw [2:0] = 3'b111; //4
sw [5:3] = 3'b010; //1

#10;


$finish;
end
endmodule
