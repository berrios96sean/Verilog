`default_nettype none
module declaring_wires (
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    wire and_one; 
    wire and_two; 
    wire or_one;
    
    assign and_one = a & b; 
    assign and_two = c & d; 
    assign or_one = and_one | and_two; 
    assign out = or_one; 
    assign out_n = ~(or_one); 

endmodule

module testbench();
    reg a, b, c, d; 
    wire out, out_n;


    declaring_wires dut (
    .a(a), .b(b), .c(c), .d(d), .out(out), .out_n(out_n)
    );

    initial begin
    $dumpfile("declaring_wires.vcd");
    $dumpvars(0, testbench);
    end

    initial begin

    for (integer i = 0; i < 4; i = i +1) begin
        a = $random; 
        b = $random;
        c = $random; 
        d = $random;
    #1;
                $display("Input a = %b", a);
                $display("Input b = %b", b);
                $display("Input c = %b", c);
                $display("Input d = %b", d);
                $display("Output = %b", out);
                $display("Output_N = %b", out_n);
                $display("\n");
    end
    end
endmodule