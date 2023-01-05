`include "mod_a.v"

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    
    mod_a moddef ( out1, out2, a, b, c, d);

endmodule

module testbench;
    
    // Inputs
    reg a,b;

    // Outputs
    wire out;
    
    // Instantiate the module
    top_module dut (
    .a(a),
    .b(b),
    .out(out)
    );
    
    initial begin
        $dumpfile("top_module.vcd");
        $dumpvars(0, testbench);
    end

    initial begin


        
        #1;
        a = 1'b0;
        b = 1'b0; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("Output");
        $display("Out = %b",out);
        $display();

        a = 1'b0;
        b = 1'b1; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("Output");
        $display("Out = %b",out);
        $display();

        a = 1'b1;
        b = 1'b0; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("Output");
        $display("Out = %b",out);
        $display();

        a = 1'b1;
        b = 1'b1; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("Output");
        $display("Out = %b",out);
        $display();

        
        
        $finish;  // End the simulation
    end
    
endmodule
