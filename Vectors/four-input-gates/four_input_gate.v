module four_input_gate( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = (in[0] & in[1] & in[2] & in[3]);
    assign out_or = (in[0] | in[1] | in[2] | in[3]);
    assign out_xor = (in[0] ^ in[1] ^ in[2] ^ in[3]);

endmodule

module testbench;
    
    // Inputs
    reg [3:0] in;

    // Outputs
    wire out_and;
    wire out_or;
    wire out_xor;
    
    // Instantiate the module
    four_input_gate dut (
        .in(in),
        .out_and(out_and),
        .out_or(out_or),
        .out_xor(out_xor)
    );
    
    initial begin
        $dumpfile("four_input_gate.vcd");
        $dumpvars(0, testbench);
    end

    initial begin

        $display("Generating 8 random inputs");
        // Generate 8 random inputs and print the inputs and outputs
        for (integer i = 0; i < 8; i++) begin
            in = $random; 
            #1;  // Wait 1 time unit
            $display("Input = %h", in);
            $display("Output");
            $display("out_and = %h", out_and);
            $display("out_or = %h", out_or);
            $display("out_xor = %h", out_xor);
            $display("\n");
        end
        
        $finish;  // End the simulation
    end
    
endmodule
