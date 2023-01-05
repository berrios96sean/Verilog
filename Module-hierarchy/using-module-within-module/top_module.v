`include "mod_a.v"

module top_module ( input a, input b, output out );

    mod_a instance1 ( .in1(a), .in2(b), .out(out) ); 
    //Can also use below syntax
    //mod_a instance2 ( a, b, out );

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
