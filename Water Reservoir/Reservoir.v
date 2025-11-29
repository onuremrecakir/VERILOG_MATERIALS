module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [1:0] state; 
    reg [1:0] next_state;
    parameter NON = 2'b00, S1 = 2'b01, S12 = 2'b10, S123 = 2'b11;    
    
    always @ (*)
        begin
                   
            if 		(s[3] == 1'b1) next_state = S123;
            else if (s[2] == 1'b1) next_state = S12;
            else if (s[1] == 1'b1) next_state = S1;
            else if (s[1] == 1'b0) next_state = NON;
               
            case (state)
            NON: begin fr1 = 1'b1; fr2 = 1'b1; fr3 = 1'b1; end
            S1: begin fr1 = 1'b1; fr2 = 1'b1; fr3 = 1'b0; end
            S12: begin fr1 = 1'b1; fr2 = 1'b0; fr3 = 1'b0; end
            S123: begin fr1 = 1'b0; fr2 = 1'b0; fr3 = 1'b0; end
            endcase
             
        end
     
    always @ (posedge clk)
        begin 
            
            if (reset) begin state <= NON; dfr <= 1'b1; end
            else begin state <= next_state;
                
                if (next_state < state) dfr = 1'b1; 
           		else if (next_state > state)  dfr = 1'b0;   
            end
        end
        
endmodule
