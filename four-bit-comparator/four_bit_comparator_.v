`timescale 10 ns / 1 ns 

module four_bit_comparator_(input wire [3:0] a, b, 
			   input wire eq_in, gt_in, lt_in, 
			   output wire eq_out, gt_out, lt_out);

		   wire aeqb, qltb, qgtb;

		   assign aeqb = (a==b);
		   assign altb = (a<b);
		   assign agtb = (a>b);
		   assign eq_out = aeqb & eq_in;
		   assign gt_out = agtb | gt_in & aeqb;
		   assign lt_out = altb | lt_in & aeqb;

		   
endmodule







