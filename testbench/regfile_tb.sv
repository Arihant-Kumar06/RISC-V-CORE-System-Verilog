`timescale 1ns/1ps

module regfile_tb;

reg clk;
reg reg_write_enable;
reg [4:0] read_addr1;
reg [4:0] read_addr2;
reg [4:0] write_addr;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;

regfile u_regfile(
    .clk (clk),
    .reg_write_enable (reg_write_enable),
    .read_addr1 (read_addr1),
    .read_addr2 (read_addr2),
    .write_addr (write_addr),
    .read_data1 (read_data1),
    .read_data2 (read_data2),
    .write_data (write_data)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reg_write_enable = 0;
    read_addr1 = 0;
    read_addr2 = 0;
    write_addr = 0;
    write_data = 0;

    #10;


    $display("-- Test 1: Write to x1; Read x1 and x0 --");
    reg_write_enable = 1;
    write_addr = 5'd1;
    write_data = 32'hDEADBEEF;
    read_addr1 = 5'd1;
    read_addr2 = 5'd0;

    #10;
    reg_write_enable = 0;
    $display("x1 should be 0xDEADBEEF, x0 should be 0x00000000");
    $display("Read Data 2 (x1): 0x%h, Read Data 2 (x0): 0x%h", read_data1,read_data2);
    
    #10;
    $display("-- Test 2 :Attempt write to x0, Read x0 and x1 --");
    reg_write_enable = 1;
    write_addr = 5'd0;
    write_data = 32'hCAFECAFE;
    read_addr1 = 5'd0;
    read_addr2 = 5'd1;

    #10;
    reg_write_enable = 0;
    $display("x0 should still be 0x00000000, x1 should be 0xDEADBEEF");
    $display("Read Data 1 (x0): 0x%h, Read Data 2 (x1): 0x%h", read_data1, read_data2);

    #10;

    $display("-- Test 3: Write to x5, Read X1 and x5 --");
    reg_write_enable = 1;
    write_addr = 5'd5;
    write_data = 32'h12345678;
    read_addr1 = 5'd1;
    read_addr2 = 5'd5;
    #10;
    reg_write_enable = 0;
    $display("x! should be 0xDEADBEEF, x5 should be 0x12345678");
    $display("Read Data 1 (x1): 0x%h, Read Data 2 (x5): 0x%h", read_data1, read_data2);

    #20;
    $display("Register File Simulation Finished.");
    $finish;
end

    initial begin
        $dumpfile("regfile_test.vcd");
        $dumpvars(0, regfile_tb);
    end

endmodule
