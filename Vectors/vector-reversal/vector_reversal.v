module vector_reversal ( 
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule

module testbench;
    
    // Inputs
    reg [7:0] in;

    // Outputs
    wire [7:0] out;
    
    // Instantiate the module
    vector_reversal dut (
    .in(in),
    .out(out)
    );
    
    initial begin
        $dumpfile("vector_reversal.vcd");
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
            $display("Output = %h", out);
            $display("\n");
        end
        
        $finish;  // End the simulation
    end
    
endmodule

