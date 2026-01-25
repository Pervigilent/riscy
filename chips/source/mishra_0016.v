module chip_top (
    a_in,
    b_in,
    c_in,
    d_out,
    e_out,
    f_out
);

    // -------------------------------------------------------------------------
    // Port Declarations
    // -------------------------------------------------------------------------
    input   a_in;
    input   b_in;
    input   c_in;

    output  d_out;
    output  e_out;
    output  f_out;

    // -------------------------------------------------------------------------
    // Parameters
    //
    // Parameters can be declared in two ways:
    // 1. By using an include file such as 'chiptop_parameters.vh'.
    //    This is a good way to control parameters through one global file.
    //    When design requirements change, only this file needs editing.
    // 2. By declaring the parameters in the highest-level module.
    // -------------------------------------------------------------------------
    parameter FIFO_PTR_CHAN0   = 6,
              FIFO_WIDTH_CHAN0 = 32;

    parameter FIFO_PTR_CHAN1   = 8,
              FIFO_WIDTH_CHAN1 = 32;

    // -------------------------------------------------------------------------
    // FIFO instantiation for Channel 0
    // -------------------------------------------------------------------------
    asynch_fifo #(
        .FIFO_PTR   (FIFO_PTR_CHAN0),
        .FIFO_WIDTH (FIFO_WIDTH_CHAN0)
    ) asynch_fifo_chan0 (
        .wrclk      (wrclk),
        .rstb_wrclk (rstb_wrclk),
        .write_en   (write_en_chan0),
        .write_data (write_data_chan0),
        .rdclk      (rdclk),
        .rstb_rdclk (rstb_rdclk),
        .read_en    (read_en_chan0),
        .read_data  (read_data_chan0),
        .fifo_full  (fifo_full_chan0),
        .fifo_empty (fifo_empty_chan0)
    );

    // -------------------------------------------------------------------------
    // FIFO instantiation for Channel 1
    // -------------------------------------------------------------------------
    asynch_fifo #(
        .FIFO_PTR   (FIFO_PTR_CHAN1),
        .FIFO_WIDTH (FIFO_WIDTH_CHAN1)
    ) asynch_fifo_chan1 (
        .wrclk      (wrclk),
        .rstb_wrclk (rstb_wrclk),
        .write_en   (write_en_chan1),
        .write_data (write_data_chan1),
        .rdclk      (rdclk),
        .rstb_rdclk (rstb_rdclk),
        .read_en    (read_en_chan1),
        .read_data  (read_data_chan1),
        .fifo_full  (fifo_full_chan1),
        .fifo_empty (fifo_empty_chan1)
    );

endmodule

