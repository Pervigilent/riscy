module asynch_fifo #(
    parameter FIFO_PTR   = 4,
    parameter FIFO_WIDTH = 32
) (
    wrclk,
    rstb_wrclk,
    write_en,
    write_data,
    rdclk,
    rstb_rdclk,
    read_en,
    read_data,
    fifo_full,
    fifo_empty
);

    // -------------------------------------------------------------------------
    // Input and Output Declarations
    // -------------------------------------------------------------------------
    input                     wrclk;
    input                     rstb_wrclk;
    input                     write_en;
    input  [FIFO_WIDTH-1:0]   write_data;

    input                     rdclk;
    input                     rstb_rdclk;
    input                     read_en;

    output [FIFO_WIDTH-1:0]   read_data;
    output                    fifo_full;
    output                    fifo_empty;

    // -------------------------------------------------------------------------
    // FIFO controller implementation
    // (Omitted)
    // -------------------------------------------------------------------------

endmodule

