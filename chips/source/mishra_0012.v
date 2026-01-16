always @(*)
    begin
        state_nxt = state; // Declare the default value in the beginning


        case (state)
            IDLE: begin
                if (start_wire)
                    state_nxt = WRITE;
                else  if (start_read)
                    state_nxt = READ;
                //else state_nxt = state; // Already covered in the beginning
            end
            WRITE: begin
                if (end_wire)
                    state_nxt = IDLE;
                //else state_nxt = state; // Already covered in the beginning
            end
            READ: begin
                if (end_read)
                    state_nxt = IDLE;
                //else state_nxt = state; // Already covered in the beginning
            end

            default: begin
                // No action
            end
        endcase
    end

