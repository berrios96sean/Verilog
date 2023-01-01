`timescale 1ns / 1ps

module nor_gate( 
    input a, 
    input b, 
    output out );
    
    assign out = ~(a|b);

endmodule

module nor_gate_tb;
  // Inputs
  reg a, b;

  // Output
  wire y;

  // Instantiate the NOR gate
  nor_gate nor_gate_instance (
    .a(a),
    .b(b),
    .out(y)
  );

initial begin
  $dumpfile("nor-gate.vcd");
  $dumpvars(0, nor_gate_tb);
end

  // Test case
  initial begin
    // Set input values
    a = 0;
    b = 0;
    $display("Input: a = %b, b = %b", a, b);
    #5;

    // Check output
    $display("Output: y = %b", y);

    // Set input values
    a = 0;
    b = 1;
    $display("Input: a = %b, b = %b", a, b);
    #5;

    // Check output
    $display("Output: y = %b", y);

    // Set input values
    a = 1;
    b = 0;
    $display("Input: a = %b, b = %b", a, b);
    #5;

    // Check output
    $display("Output: y = %b", y);

    // Set input values
    a = 1;
    b = 1;
    $display("Input: a = %b, b = %b", a, b);
    #5;

    // Check output
    $display("Output: y = %b", y);
  end
endmodule
