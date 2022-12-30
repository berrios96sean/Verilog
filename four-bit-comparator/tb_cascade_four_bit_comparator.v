`timescale 10 ns / 1 ns

module cascade_four_bit_comparator
#(parameter M = 1)
(input [M-1:0] a, b,
output aEQb, aLTb, aGTb);
generate
	parameter Stages = M/4;
	wire [Stages:0] EQ_bus, LT_bus, GT_bus;

	assign EQ_bus[0] = 1'b1; 
	assign LT_bus[0] = 1'b0;
	assign GT_bus[0] = 1'b0;
	assign aEQb = EQ_bus[Stages];
	assign aLTb = LT_bus[Stages];
	assign aGTb = GT_bus[Stages];

	four_bit_comparator  Comp[Stages-1:0] (.a(a[M-1:0]),.b(b[M-1:0]),.eq_in(EQ_bus[Stages-1:0]),.lt_in(LT_bus[Stages-1:0]),        
				.gt_in(GT_bus[Stages-1:0]),.eq_out(EQ_bus[Stages:1]),.lt_out(LT_bus[Stages:1]),.gt_out(GT_bus[Stages:1]));
endgenerate

endmodule
