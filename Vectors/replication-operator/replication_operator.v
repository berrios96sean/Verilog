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
    vector_concatenation dut (
    .in(in),
    .out(out)
    );
    
    initial begin
        $dumpfile("vector_concatenation.vcd");
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
            f = $random; 
            #1;  // Wait 1 time unit
            $display("Input a = %h", a);
            $display("Input b = %h", b);
            $display("Input c = %h", c);
            $display("Input d = %h", d);
            $display("Input e = %h", e);
            $display("Input f = %h", f);
            $display("Output");
            $display("Output_w = %h", w);
            $display("Output_x = %h", x);
            $display("Output_y = %h", y);
            $display("Output_z = %h", z);
            $display("\n");
        end
        
        $finish;  // End the simulation
    end
    
endmodule

