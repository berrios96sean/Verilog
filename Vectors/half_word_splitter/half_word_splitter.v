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
    
  reg [31:0] in;
  wire [31:0] out;

  reverse_32_bit_vector DUT(in, out);

  initial begin
    for (int i=0; i<8; i++) begin
      in = $random;
      #1;
      $display("Input = %b", in);
      $display("Output = %b", out);
      $display("\n");
    end
  end
    
endmodule
