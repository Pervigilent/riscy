always @(*)
    begin
        data_out_nxt = data_in0; // Declare default value in the beginning

        case (1'b1)
            data_sel[0]: data_out_nxt = data_in0;
            data_sel[1]: data_out_nxt = data_in1;
            data_sel[2]: data_out_nxt = data_in2;
            data_sel[3]: data_out_nxt = data_in3;
            default: begin
                    // No action
                end
        endcase
    end

