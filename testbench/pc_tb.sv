`timescale 1ns / 1ps 
module pc_tb;

reg clk;
reg reset;
wire [31:0] pc_out;
wire [31:0] pc_plus_4_value;

pc u_pc(
    .clk (clk),
    .reset (reset),
    .next_pc_in (pc_plus_4_value),
    .pc_out (pc_out)
);

pc_plus_4 dut(
    .current_pc (pc_out),
    .pc_plus_4_value (pc_plus_4_value)
);

initial begin 
    clk = 0;
    forever #5 clk = ~clk ;
end

initial begin 

    $dumpfile("pc_test.vcd");
    $dumpvars(0, pc_tb);

    reset = 1;
    #10;
    reset = 0 ;

    #10 ;
    #10 ; 
    #10 ; 
    #10 ; 
    
    reset = 1;
    #10 ; 
    reset = 0;
    #10 ; 

    $display("Simulation Finished.");
    $finish;

   
end

initial begin
    $monitor("Time=%0t, clk=%b, reset=%b pc_out=0x%h, pc_plus_4_value=0x%h",
            $time, clk, reset, pc_out, pc_plus_4_value);
end

endmodule