`include "cascade_four_bit_comparator.v"

`timescale 10 ns / 1 ns 

module tb_cascade_four_bit_comparator
	#(parameter N = 1, 
	  parameter M = 1);

  	reg [M-1:0] a, b;
	wire aEQb, aLTb, aGTb;
	reg [39:0] Ans; 

	initial 
		begin 
		$dumpfile("tb_cascade_four_bit_comparator.vcd");
		$dumpvars(0,tb_cascade_four_bit_comparator);
	end

	cascade_four_bit_comparator #(.M(M)) CK(.a(a),.b(b),.aEQb(aEQb),.aLTb(aLTb),.aGTb(aGTb));

	initial
		$display("M = %d", M); 

	always @(*)
		Ans = (aLTb ? "a < b" : (aGTb ? "a > b" : "a = b"));

	initial 
		$monitor("@ time = %d, a = %d, b = %d,(aEQb, aLTb, aGTb) = (%b, %b, %b),Ans = %s",$time, a,b,aEQb,aLTb,aGTb,Ans);

	initial 
		begin 
		repeat(N)
		begin 
		a = $random; 
		b = $random; 
		#1;
	end
		#1 $finish;
	end 
endmodule
