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
    reg [4:0] a,b,c,d,e,f;

    // Outputs
    wire [7:0] w,x,y,z;
    
    // Instantiate the module
    vector_concatenation dut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .w(w),
    .x(x),
    .y(y),
    .z(z)
    );
    
    initial begin
        $dumpfile("vector_concatenation.vcd");
        $dumpvars(0, testbench);
    end

    initial begin

        e = 0; 
        f = 0; 
        $display("Generating 8 random inputs");
        // Generate 8 random inputs and print the inputs and outputs
        for (integer i = 0; i < 8; i++) begin
            a = 0;
            b = 0;
            c = 0;
            d = 0;
            e = i; 
            f = i; 
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
