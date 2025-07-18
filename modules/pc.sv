module pc (
    input wire clk ,
    input wire reset,
    input wire [31:0] next_pc_in,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset ) begin
    if(reset) begin
        pc_out <= 32'h00000000;
    end else begin 
        pc_out <= next_pc_in;
    end
end

endmodule