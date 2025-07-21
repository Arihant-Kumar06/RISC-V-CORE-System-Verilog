module imem(
    input wire [31:0] addr,
    output wire [31:0] instruction_out
);

parameter MEM_SIZE_WORDS = 256;
reg [31:0] mem [0:MEM_SIZE_WORDS-1];

initial begin
    $readmemh("assembly/instruction.mem", mem);
end

assign instruction_out = mem[addr[31:2]];

endmodule