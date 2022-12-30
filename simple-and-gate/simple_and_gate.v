// AND gate module
module and_gate (input a, b, output y);
  assign y = a & b;
endmodule

// Test bench for AND gate
module and_gate_tb;
  // Inputs
  reg a, b;

  // Output
  wire y;

  // Instantiate the AND gate
  and_gate and_gate_instance (
    .a(a),
    .b(b),
    .y(y)
  );

initial begin
  $dumpfile("<waveform_file>.vcd");
  $dumpvars(0, and_gate_tb);
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



