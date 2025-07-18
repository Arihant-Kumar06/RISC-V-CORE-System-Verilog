module pc_plus_4 (
    input wire [31:0] current_pc,
    output wire [31:0] pc_plus_4_value
);

assign pc_plus_4_value = current_pc + 32'd4; 

endmodule;