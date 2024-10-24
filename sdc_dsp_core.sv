
module sdc_dsp_core
	#(parameter WORD_SIZE = 32)
	(input logic clk,
	 input logic rst);
	 
wire [WORD_SIZE-1:0] din1,din2,dout;
wire [4:0] fcn;
wire cr,z,n,err;
	 
sdc_alu #(.BIT_WIDTH(WORD_SIZE)) _alu
	(.alu_in1(din1), 
	 .alu_in2(din2), 
	 .alu_fcn(fcn),
	 .alu_out(dout),
	 .alu_cr(cr), 
	 .alu_zero(z), 
	 .alu_neg(n), 
	 .alu_err(err));

endmodule
