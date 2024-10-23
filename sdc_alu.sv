
module sdc_alu 
	#(parameter BIT_WIDTH = 32)
	 (input logic [BIT_WIDTH-1:0] alu_in1, alu_in2,
	  input logic [4:0] alu_fcn,
	  output logic [BIT_WIDTH-1:0] alu_out,
	  output logic alu_cr, alu_zero, alu_neg, alu_err);
	  
	  always @(alu_fcn, alu_in1, alu_in2)
	  begin
		  case (alu_fcn)
		  5'b00000: alu_out = !alu_in1;
		  5'b00001: alu_out = alu_in1 | alu_in2;
		  5'b00010: alu_out = alu_in1 & alu_in2;
		  5'b00011: alu_out = alu_in1 ^ alu_in2;
		  5'b00100: {alu_cr,alu_out} = alu_in1 + alu_in2;
		  5'b00101: {alu_cr,alu_out} = alu_in1 - alu_in2;
		  default: alu_err = 1;
		  endcase
		  
		  if (alu_out == 0)
				alu_zero = 1;
	  end
	  
	  assign alu_neg = alu_out[BIT_WIDTH-1];

endmodule
