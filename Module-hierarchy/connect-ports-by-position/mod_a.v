module mod_a ( 
    output out1, 
    output out2, 
    input a, 
    input b, 
    input c, 
    input d 
    );

    assign out1 = a&b; 
    assign out2 = c|d;
    
endmodule