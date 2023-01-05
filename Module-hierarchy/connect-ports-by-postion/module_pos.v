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
    reg a,b,c,d;

    // Outputs
    wire out1,out2;
    
    // Instantiate the module
    top_module dut (
    .a(a),
    .b(b),
    .c(c), 
    .d(d),
    .out1(out1),
    .out2(out2)
    );
    
    initial begin
        $dumpfile("module_pos.vcd");
        $dumpvars(0, testbench);
    end

    initial begin


        $display("Output 1 is an AND gate with (a & b) as input");
        $display("Output 2 is an OR gate with (c | d) as input");
        #1;
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("c = %b",c);
        $display("d = %b",d);
        $display("Output");
        $display("Out1 = %b",out1);
        $display("Out2 = %b",out2);
        $display();

        a = 1'b0;
        b = 1'b1;
        c = 1'b0;
        d = 1'b1; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("c = %b",c);
        $display("d = %b",d);
        $display("Output");
        $display("Out1 = %b",out1);
        $display("Out2 = %b",out2);
        $display();

        a = 1'b1;
        b = 1'b0;
        c = 1'b1;
        d = 1'b0; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("c = %b",c);
        $display("d = %b",d);
        $display("Output");
        $display("Out1 = %b",out1);
        $display("Out2 = %b",out2);
        $display();

        a = 1'b1;
        b = 1'b1;
        c = 1'b1;
        d = 1'b1; 
        #5;
        $display("Inputs");
        $display("a = %b",a);
        $display("b = %b",b);
        $display("c = %b",c);
        $display("d = %b",d);
        $display("Output");
        $display("Out1 = %b",out1);
        $display("Out2 = %b",out2);
        $display();

        
        
        $finish;  // End the simulation
    end
    
endmodule
