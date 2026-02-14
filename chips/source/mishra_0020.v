module gray_to_binary #(
    parameter PTR = 6
) (
    gray_value,
    binary_value
);

    // -------------------------------------------------------------------------
    // Port Declarations
    // -------------------------------------------------------------------------
    input  [PTR:0] gray_value;
    output [PTR:0] binary_value;

    // Continuous assignment requires a net declaration
    wire   [PTR:0] binary_value;

    // -------------------------------------------------------------------------
    // Gray to Binary Conversion
    // -------------------------------------------------------------------------
    assign binary_value[PTR] = gray_value[PTR];

    generate
        genvar i;
        for (i = 0; i < PTR; i = i + 1) begin : gen_gray_to_binary
            assign binary_value[i] =
                binary_value[i + 1] ^ gray_value[i];
        end
    endgenerate

endmodule

