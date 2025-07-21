`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;

cpu u_cpu(
    .clk (clk),
    .reset (reset)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("cpu_test.vcd");
    $dumpvars(0, cpu_tb);

    reset = 1;
    #20;
    reset = 0;

    #100;

    $display("CPU Fetch Simulation Finished.");
    $finish;

end

endmodule