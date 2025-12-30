module riscv_core (
    input  wire        clk,
    input  wire        rst_n,

    // Instruction memory interface
    output wire [31:0] imem_addr,
    input  wire [31:0] imem_rdata,

    // Data memory interface
    output wire        dmem_we,
    output wire [31:0] dmem_addr,
    output wire [31:0] dmem_wdata,
    input  wire [31:0] dmem_rdata
);
// Program counter (PC)
    reg [31:0] pc;
    wire [31:0] pc_next;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pc <= 32'h00000000;
        else
            pc <= pc_next;
    end

    assign imem_addr = pc;
// Instruction fetch
    wire [31:0] instr;
    assign instr = imem_rdata;
// Instruction decode
    wire [6:0]  opcode = instr[6:0];
    wire [4:0]  rd     = instr[11:7];
    wire [2:0]  funct3 = instr[14:12];
    wire [4:0]  rs1    = instr[19:15];
    wire [4:0]  rs2    = instr[24:20];
    wire [6:0]  funct7 = instr[31:25];
// Immediate generator (RV32I)
    reg [31:0] imm;

    always @* begin
        case (opcode)
            7'b0010011,  // I-type
            7'b0000011:
                imm = {{20{instr[31]}}, instr[31:20]};
            7'b0100011:  // S-type
                imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            7'b1100011:  // B-type
                imm = {{19{instr[31]}}, instr[31], instr[7],
                       instr[30:25], instr[11:8], 1'b0};
            7'b1101111:  // J-type
                imm = {{11{instr[31]}}, instr[31],
                       instr[19:12], instr[20],
                       instr[30:21], 1'b0};
            default:
                imm = 32'b0;
        endcase
    end
// Register file
    wire [31:0] rs1_data, rs2_data;
    wire        reg_we;
    wire [31:0] reg_wdata;

    regfile rf (
        .clk(clk),
        .we(reg_we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(reg_wdata),
        .rd1(rs1_data),
        .rd2(rs2_data)
    );
// ALU
    reg [31:0] alu_result;

    always @* begin
        case (funct3)
            3'b000: alu_result = rs1_data + imm; // ADDI
            3'b010: alu_result = ($signed(rs1_data) < $signed(imm));
            3'b011: alu_result = (rs1_data < imm);
            3'b100: alu_result = rs1_data ^ imm;
            3'b110: alu_result = rs1_data | imm;
            3'b111: alu_result = rs1_data & imm;
            default: alu_result = 32'b0;
        endcase
    end
// Load / store interface
    assign dmem_addr  = alu_result;
    assign dmem_wdata = rs2_data;
    assign dmem_we    = (opcode == 7'b0100011); // STORE
// Writeback logic
    assign reg_we =
        (opcode == 7'b0010011) | // OP-IMM
        (opcode == 7'b0000011);  // LOAD

    assign reg_wdata =
        (opcode == 7'b0000011) ? dmem_rdata :
                                 alu_result;
// PC update logic
    assign pc_next = pc + 32'd4;
endmodule

