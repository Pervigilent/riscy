parameter NUM_OF_PORTS = 16;

generate
    genvar n;
    for (n = 0; n < NUM_OF_PORTS; n = n + 1) begin : switch_port_inst
        switch_port switch_port_u (
        .a          (in1[n]),
        .b          (in2[n]),
        .c          (out1[n]),
        .d          (out2[n])
        );
    end
endgenerate
