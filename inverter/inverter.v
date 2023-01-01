`timescale 1ns / 1ps

module inverter( input in, output out );
assign out = ~in; 
endmodule

module tb_inverter;
reg in;
wire out;

inverter dut (in, out);

initial begin
  $dumpfile("Inverter.vcd");
  $dumpvars(0, tb_inverter);
end

initial begin
#10 in = 1'b0;
#10 in = 1'b1;
#10 $finish;
end

initial begin
$monitor("Input = %b", in);
$monitor("Output = %b", out);
end
endmodule