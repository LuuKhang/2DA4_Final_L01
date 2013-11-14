module inputConditioning (Sign, clk, SignOut);

	input [0:0] Sign;	
	input clk; 
	output reg [0:0] SignOut;
	
	reg [1:0] state;
	
	parameter lowState = 2'b00,
				 highState = 2'b01,
				 pseudoLowState = 2'b10;
				
	always @(posedge clk) begin
			case (state)
				
				lowState: if Sign[0] state = highState;
							 else begin 
										SignOut = 1'b0;
										state = lowState;
									end
							 
				highState: SignOut[0] = Sign[0];
							  state = pseudoLowState;
							  
				pseudoLowState: if ~Sign[0] state = lowState;
									 else begin 
												SignOut = 1'b0;
												state = pseudoLowState;
											end
			endcase;
	end

		
endmodule
		