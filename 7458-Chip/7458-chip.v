`timescale 1ns / 1ps

module chip_7458 ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and_one; 
    wire and_two; 
    wire and_three; 
    wire and_four; 
    wire or_one; 
    wire or_two; 

    assign and_one = p2a & p2b; 
    assign and_two = p2c & p2d; 
    assign p2y = and_one | and_two; 

    assign and_three = p1a & p1c & p1b; 
    assign and_four = p1f & p1e & p1d; 
    assign p1y = and_three | and_four; 

endmodule



module testbench();
reg p1a, p1b, p1c, p1d, p1e, p1f;
wire p1y;
reg p2a, p2b, p2c, p2d;
wire p2y;
integer i; 

chip_7458 dut (
.p1a(p1a), .p1b(p1b), .p1c(p1c), .p1d(p1d), .p1e(p1e), .p1f(p1f),
.p1y(p1y),
.p2a(p2a), .p2b(p2b), .p2c(p2c), .p2d(p2d),
.p2y(p2y)
);

initial begin
  $dumpfile("7458_chip.vcd");
  $dumpvars(0, testbench);
end

initial begin
for (i = 0; i < 64; i = i +1) begin
// Set inputs
p1a = i[0]; p1b = i[1]; p1c = i[2]; p1d = i[3]; p1e = i[4]; p1f = i[5];
p2a = i[6]; p2b = i[7]; p2c = i[8]; p2d = i[9];
#1;
$display("Input = %b %b %b %b %b %b %b %b %b %b", p1a, p1b, p1c, p1d, p1e, p1f, p2a, p2b, p2c, p2d);
$display("Output = %b %b", p1y, p2y);
end
end
endmodule