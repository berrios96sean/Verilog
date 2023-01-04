module replication_operator (
    input [7:0] in,
    output [31:0] out );
    wire [23:0]temp;
    
    assign temp = {24{in[7]}};
    assign out = {temp[23:0], in[7:0]};

endmodule

module testbench;
    
    // Inputs
    reg [7:0] in;

    // Outputs
    wire [31:0] out;
    
    // Instantiate the module
    replication_operator dut (
    .in(in),
    .out(out)
    );
    
    initial begin
        $dumpfile("replication_operator.vcd");
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

