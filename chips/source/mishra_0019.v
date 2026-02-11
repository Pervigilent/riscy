module devices_regs_withfunction (
    address,
    write_en,
    data_in,
    read_en,
    read_data,
    clk,
    resetb
);

    input  [3:0] address;
    input        write_en;
    input        read_en;
    input  [7:0] data_in;
    output [7:0] read_data;
    input        clk;
    input        resetb;
    
    reg    [7:0] reg0,
                 reg1,
                 reg2,
                 reg3;
    reg    [7:0] read_data,
                 read_data_nxt;
