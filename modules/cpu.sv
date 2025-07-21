module cpu(
    input wire clk,
    input wire reset
);

wire [31:0] pc_current_addr;
wire [31:0] pc_plus_4_val;
wire [31:0] fetched_instruction;

pc u_pc (
    .clk (clk),
    .reset (reset),
    .next_pc_in (pc_plus_4_val),
    .pc_out (pc_current_addr)
);

pc_plus_4 u_pc_plus_4 (
    .current_pc (pc_current_addr),
    .pc_plus_4_value (pc_plus_4_val)
);

imem u_imem (
    .addr (pc_current_addr),
    .instruction_out (fetched_instruction)
);

always @(posedge clk) begin
    if (!reset) begin
        $display("PC: 0x%h, Instruction: 0x%h", pc_current_addr, fetched_instruction );
    end
end

endmodule