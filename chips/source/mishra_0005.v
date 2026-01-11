module xmit_top (
    xmit_top_in1,
    xmit_top_in2,
    xmit_top_in3,
    xmit_top_in4,
    xmit_top_out1,
    xmit_top_out2,
    xmit_top_out3
);

    // ------------------------------------------------------------------
    // Port declarations
    // ------------------------------------------------------------------
    input  [7:0] xmit_top_in1;
    input        xmit_top_in2;
    input        xmit_top_in3;
    input        xmit_top_in4;

    output       xmit_top_out1;
    output       xmit_top_out2;
    output       xmit_top_out3;

    // ------------------------------------------------------------------
    // Wire declarations
    // Declare connecting signals between modules as wires.
    // Outputs need not be declared as wires as they are
    // considered wires by definition.
    // ------------------------------------------------------------------
    wire [7:0] xmit_ab;

    // ------------------------------------------------------------------
    // Module instantiations
    //
    // xmit_a is the module name and should exactly match
    // the lower-level module name. xmit_a_0 is the instance
    // name and should be unique within this module.
    // ------------------------------------------------------------------
    xmit_a xmit_a_0 (
        .xmit_a_in1  (xmit_top_in1),
        .xmit_a_in2  (xmit_top_in2),
        .xmit_a_out1 (xmit_ab),
        .xmit_a_out2 (xmit_top_out3)
    );

    xmit_b xmit_b_0 (
        .xmit_b_in1  (xmit_ab),
        .xmit_b_in2  (xmit_top_in3),
        .xmit_b_in3  (xmit_top_in4),
        .xmit_b_out1 (xmit_top_out1),
        .xmit_b_out2 (xmit_top_out2)
    );

endmodule


