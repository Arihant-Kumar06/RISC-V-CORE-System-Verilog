`timescale 1ns / 1ps

module imm_gen_tb;

reg [31:0] instruction_in;
wire [31:0] i_imm_out;
wire [31:0] s_imm_out;
wire [31:0] b_imm_out;
wire [31:0] u_imm_out;
wire [31:0] j_imm_out;

imm_gen u_imm_gen (
    .instruction (instruction_in),
    .i_imm (i_imm_out),
    .s_imm (s_imm_out),
    .b_imm (b_imm_out),
    .j_imm (j_imm_out),
    .u_imm (u_imm_out)
);

initial begin
    $dumpfile("imm_gen_test.vcd");
    $dumpvars(0, imm_gen_tb);

    instruction_in = 32'h7ff00093;
    #10;
    $display("I-Type : Inst = 0x%h, Imm = 0x%h", instruction_in, i_imm_out);

    instruction_in = 32'hfff00093;
    #10;
    $display("I-Type (-1): Inst=0x%h, I_Imm=0x%h", instruction_in, i_imm_out);

    instruction_in = 32'h00110123;
    #10;
    $display("B-Type (+8): Inst=0x%h, B_Imm=0x%h", instruction_in, b_imm_out);

    instruction_in = 32'h123450B7;
    #10;
    $display("U-Type (0x12345): Inst=0x%h, U_Imm=0x%h", instruction_in, u_imm_out);

    instruction_in = 32'h0100006F;
    #10;
    $display("J-Type (+16): Inst=0x%h, J_Imm=0x%h", instruction_in, j_imm_out);

    $display("Immediate Generator Test finished.");
    $finish;
end

endmodule