module rcv_top (
    rcv_top_in1,
    rcv_top_in2,
    rcv_top_in3,
    rcv_top_out1,
    rcv_top_out2,
    rcv_top_out3
);

    // ------------------------------------------------------------------
    input        rcv_top_in1;
    input        rcv_top_in2;
    input        rcv_top_in3;

    output [7:0] rcv_top_out1;
    output       rcv_top_out2;
    output       rcv_top_out3;

    // ------------------------------------------------------------------
    wire [7:0] rcv_cd1;
    wire       rcv_cd2;

    // ------------------------------------------------------------------
    // Module instantiations
    //
    // rcv_c is the module name and should exactly match
    // the lower-level module name. rcv_c_0 is the instance
    // name and should be unique within this module.
    // ------------------------------------------------------------------
    rcv_c rcv_c_0 (
        .rcv_c_in1  (rcv_top_in1),
        .rcv_c_in2  (rcv_cd1),
        .rcv_c_in3  (rcv_cd2),
        .rcv_c_out1 (rcv_top_out1),
        .rcv_c_out2 (rcv_top_out2)
    );

    rcv_d rcv_d_0 (
        .rcv_d_in1  (rcv_top_in1),
        .rcv_d_in2  (rcv_top_in2),
        .rcv_d_out1 (rcv_cd1),
        .rcv_d_out2 (rcv_cd2),
        .rcv_d_out3 (rcv_top_out3)
    );

endmodule


