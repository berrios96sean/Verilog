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

// Since this code is repetitive and is essentially the same as connect by posistion I will not 
// Be writing a testbench for this solution. This solution can be tested on the HDL bits website 
// which will generate the correct solution and waveform. It should be noted that the main difference 
// between the two is that in this solution the calls had to be made to the correct I/O in the mod_a 
// module. (ex. .out1(out1)) assigning by posistion will not work for this soltion. 
