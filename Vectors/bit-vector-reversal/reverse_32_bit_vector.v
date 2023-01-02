module reverse_32_bit_vector (  
    input [31:0] in,
    output [31:0] out );
   
    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8] = in[23:16];
    assign out[7:0] = in[31:24];

endmodule

module reverse_32_bit_vector_tb;
    
  reg [31:0] in;
  wire [31:0] out;

  reverse_32_bit_vector DUT(in, out);

    initial begin
        $dumpfile("reverse_32_bit_vector.vcd");
        $dumpvars(0, reverse_32_bit_vector_tb);
    end

  initial begin
    for (integer i=0; i<8; i++) begin
      in = $random;
      #1;
      $display("Input = %h", in);
      $display("Output = %h", out);
      $display("\n");
    end
  end
    
endmodule