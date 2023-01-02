`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
`timescale 1ns / 1ps

module half_word_splitter( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];

endmodule

module half_word_splitter_tb;
    
    // Inputs
    reg [15:0] in;
    
    // Outputs
    wire [7:0] out_hi;
    wire [7:0] out_lo;
    
    // Instantiate the module
    half_word_splitter dut (
        .in(in),
        .out_hi(out_hi),
        .out_lo(out_lo)
    );
    
    initial begin
        $dumpfile("half_word_splitter.vcd");
        $dumpvars(0, half_word_splitter_tb);
    end

    initial begin

        $display("Generating 8 random inputs");
        // Generate 8 random inputs and print the inputs and outputs
        for (integer i = 0; i < 8; i++) begin
            in = $random;
            #1;  // Wait 1 time unit
            $display("Input = %b", in);
            $display("Output_hi = %b", out_hi);
            $display("Output_lo = %b", out_lo);
        end
        
        $finish;  // End the simulation
    end
    
endmodule

