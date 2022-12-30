`include "four_bit_comparator_.v"

module tb_four_bit_comparator
	#(parameter N =1);

	reg [3:0] a, b; 
	wire aLTb, aEQb, aGTb;
	reg [39:0] Ans;

	four_bit_comparator_ MK(.a(a), .b(b), .lt_in(1'b0), .eq_in(1'b1), .gt_in(1'b0), .lt_out(aLTb),.gt_out(aGTb),.eq_out(aEQb));

	always @(*)
		Ans = (aLTb ? "a < b" : (aGTb ? "a > b" : "a = b"));

	initial 
	
		$monitor("@ time = %d, a = %d, b = %d, (aLTB, aEQb, aGTB) = (%b %b %b), Ans = %s", $time, a, b, aLTb, aEQb, aGTb,Ans);

	initial
	begin 

		$dumpfile("tb_four_bit_comparator.vcd");
		$dumpvars(0,tb_four_bit_comparator);
	
	repeat(N)
		begin 
		a = $random;
		b = $random; 
		#1;
	end
	#1 $finish; 
end 
endmodule 