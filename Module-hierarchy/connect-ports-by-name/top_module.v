module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

  mod_a moddef ( .out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));

endmodule

// Since this code is repetitive and is the same as connect by posistion I will not 
// Be writing a testbench for this solution 