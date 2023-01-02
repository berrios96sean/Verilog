`timescale 1ns / 1ps

module simple_vector ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration

    assign outv = vec[2:0];
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];

endmodule

module simple_vector_tb;

reg [2:0] vec;
wire [2:0] outv;
wire o2;
wire o1;
wire o0;

simple_vector DUT (
.vec(vec),
.outv(outv),
.o2(o2),
.o1(o1),
.o0(o0)
);

initial begin
  $dumpfile("simple-vector.vcd");
  $dumpvars(0, simple_vector_tb);
end

initial begin
  // Initialize the inputs
  vec = 0;
  
  // Wait 100 ns for global reset to finish
  #100;
  
  // Test all possible input combinations
  for (integer i = 0; i < 8; i++) begin
    // Set the input vector value
    vec = i;
    
     // Wait 1 ns to allow the outputs to update
    #1;

    // Print the input and output values
    $display("Input = %b", vec);
    $display("output = %b", outv);
    $display("o2 = %b", o2);
    $display("o1 = %b", o1);
    $display("o0 = %b", o0);
  end
end

endmodule