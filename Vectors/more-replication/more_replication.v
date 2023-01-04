module more_replication (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    assign out = ~{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}^{5{a,b,c,d,e}};
               

endmodule

module testbench;
    
    // Inputs
    reg a,b,c,d,e;

    // Outputs
    wire [24:0] out;
    
    // Instantiate the module
    more_replication dut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .out(out)
    );
    
    initial begin
        $dumpfile("more_replication.vcd");
        $dumpvars(0, testbench);
    end

    initial begin

        $display("Generating 8 random inputs");
        // Generate 8 random inputs and print the inputs and outputs
        for (integer i = 0; i < 8; i++) begin
            a = $random;
            b = $random;
            c = $random;
            d = $random;
            e = $random;
            #1;  // Wait 1 time unit
            $display("Input a = %h", a);
            $display("Input b = %h", b);
            $display("Input c = %h", c);
            $display("Input d = %h", d);
            $display("Input e = %h", e);
            $display("Output");
            $display("Output = %h", out);
            $display("\n");
        end
        
        $finish;  // End the simulation
    end
    
endmodule