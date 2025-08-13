module imm_gen(
    input  wire [31:0] instruction,
    output wire [31:0] i_imm,
    output wire [31:0] s_imm,
    output wire [31:0] b_imm,
    output wire [31:0] u_imm,
    output wire [31:0] j_imm
);

    // I-Type Immediate: instruction[31:20] sign-extended
    // Example: addi, lw, jalr
    assign i_imm = {{20{instruction[31]}}, instruction[31:20]};

    // S-Type Immediate: {instruction[31:25], instruction[11:7]} sign-extended
    // Example: sw, sb
    assign s_imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

    // B-Type Immediate: {instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0} sign-extended
    // Example: beq, bne
    assign b_imm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};

    // U-Type Immediate: {instruction[31:12], 12'b0}
    // Example: lui, auipc
    assign u_imm = {instruction[31:12], 12'b0};

    // J-Type Immediate: {instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0} sign-extended
    // Example: jal
    assign j_imm = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};

endmodule
