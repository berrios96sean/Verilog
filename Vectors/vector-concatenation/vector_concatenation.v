module vector_concatenation (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );

    wire [31:0] concat;
    assign concat = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0],2'b11};


    assign w = concat[31:24];
    assign x = concat[23:16];
    assign y = concat[15:8];
    assign z = concat[7:0];

endmodule

module testbench;
    
    // Inputs
    reg [2:0] a;
    reg [2:0] b; 

    // Outputs
    wire [2:0] out_or_bitwise;
    wire out_or_logical;
    wire [5:0] out_not;
    
    // Instantiate the module
    bitwise_logical_operators dut (
        .a(a),
        .b(b),
        .out_or_bitwise(out_or_bitwise),
        .out_or_logical(out_or_logical),
        .out_not(out_not)
    );
    
    initial begin
        $dumpfile("bitwise_logical_operators.vcd");
        $dumpvars(0, testbench);
    end

    initial begin

        $display("Generating 8 random inputs");
        // Generate 8 random inputs and print the inputs and outputs
        for (integer i = 0; i < 8; i++) begin
            a = $random;
            b = 0; 
            #1;  // Wait 1 time unit
            $display("Input a = %h", a);
            $display("Input b = %h", b);
            $display("Output_or_bitwise = %h", out_or_bitwise);
            $display("Output_or_logical = %h", out_or_logical);
            $display("Output_not = %h", out_not);
            $display("\n");
        end
        
        $finish;  // End the simulation
    end
    
endmodule
