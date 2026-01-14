// -----------------------------------------------------------------------------
// Top Module Comments
// -----------------------------------------------------------------------------
/*
Copyright Notice:
    Put copyright notice here.

Functionality:
    This module implements an arbiter that processes requests from
    multiple agents and asserts a grant to one requesting agent.
    The arbitration scheme is round-robin, providing equal fairness
    to all agents.

    After receiving a grant, the requesting agent performs its task
    and asserts an end_transaction signal to indicate that the arbiter
    may issue a grant to the next request in line.

Author:
    John Doe
*/

// -----------------------------------------------------------------------------
// Module and Port Listing
// -----------------------------------------------------------------------------
module arbiter (
    clk,
    rstb,
    request0,
    request1,
    request2,
    request3,
    end_transaction0,
    end_transaction1,
    end_transaction2,
    end_transaction3,
    grant0,
    grant1,
    grant2,
    grant3
);

    // -------------------------------------------------------------------------
    // Input and Output Declarations
    // -------------------------------------------------------------------------
    input  clk;
    input  rstb;

    input  request0;           // Request remains asserted until grant is given
    input  request1;
    input  request2;
    input  request3;

    input  end_transaction0;   // Indicates end of transaction
    input  end_transaction1;
    input  end_transaction2;
    input  end_transaction3;

    output grant0;              // Asserted high to the requesting agent
    output grant1;
    output grant2;
    output grant3;

    // -------------------------------------------------------------------------
    // Parameter and Localparam Declarations
    //
    // Parameters are used for passing values across the module hierarchy.
    // Local parameters are used locally and are not passed across modules.
    // The following localparams represent the arbiter state machine states.
    // -------------------------------------------------------------------------
    localparam IDLE = 3'd0,
               GNT0 = 3'd1,
               GNT1 = 3'd2,
               GNT2 = 3'd3,
               GNT3 = 3'd4;

    // -------------------------------------------------------------------------
    // Register and Wire Declarations
    //
    // Wires are used to model combinational logic.
    // Reg variables are used to model storage elements (flip-flops).
    // -------------------------------------------------------------------------
    reg  [2:0] arb_state;
    reg  [2:0] arb_state_nxt;
    reg  [3:0] grant;
    reg  [3:0] grant_nxt;
    reg  [3:0] serv_history;
    reg  [3:0] serv_history_nxt;

    wire grant0;
    wire grant1;
    wire grant2;
    wire grant3;

    // -------------------------------------------------------------------------
    // Combinational Logic - Assign Statements
    // -------------------------------------------------------------------------
    assign {grant3, grant2, grant1, grant0} = grant;

    // -------------------------------------------------------------------------
    // Sequential Logic - Flip-Flop Inference
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rstb) begin
        if (!rstb) begin
            arb_state    <= IDLE;
            grant        <= 4'd0;
            serv_history <= 4'b1000;
        end else begin
            arb_state    <= arb_state_nxt;
            grant        <= grant_nxt;
            serv_history <= serv_history_nxt;
        end
    end

    // -------------------------------------------------------------------------
    // Combinational Logic - Next-State Logic
    // -------------------------------------------------------------------------
    always @(*) begin
        arb_state_nxt     = arb_state;
        grant_nxt         = grant;
        serv_history_nxt  = serv_history;

        case (arb_state)
            IDLE: begin
                case (1'b1)
                    serv_history[3]: begin
                        if (request0) begin
                            arb_state_nxt = GNT0;
                            grant_nxt     = 4'b0001;
                        end else if (request1) begin
                            arb_state_nxt = GNT1;
                            grant_nxt     = 4'b0010;
                        end else if (request2) begin
                            arb_state_nxt = GNT2;
                            grant_nxt     = 4'b0100;
                        end else if (request3) begin
                            arb_state_nxt = GNT3;
                            grant_nxt     = 4'b1000;
                        end
                    end

                    serv_history[0]: begin
                        if (request1) begin
                            arb_state_nxt = GNT1;
                            grant_nxt     = 4'b0010;
                        end else if (request2) begin
                            arb_state_nxt = GNT2;
                            grant_nxt     = 4'b0100;
                        end else if (request3) begin
                            arb_state_nxt = GNT3;
                            grant_nxt     = 4'b1000;
                        end else if (request0) begin
                            arb_state_nxt = GNT0;
                            grant_nxt     = 4'b0001;
                        end
                    end

                    serv_history[1]: begin
                        if (request2) begin
                            arb_state_nxt = GNT2;
                            grant_nxt     = 4'b0100;
                        end else if (request3) begin
                            arb_state_nxt = GNT3;
                            grant_nxt     = 4'b1000;
                        end else if (request0) begin
                            arb_state_nxt = GNT0;
                            grant_nxt     = 4'b0001;
                        end else if (request1) begin
                            arb_state_nxt = GNT1;
                            grant_nxt     = 4'b0010;
                        end
                    end

                    serv_history[2]: begin
                        if (request3) begin
                            arb_state_nxt = GNT3;
                            grant_nxt     = 4'b1000;
                        end else if (request0) begin
                            arb_state_nxt = GNT0;
                            grant_nxt     = 4'b0001;
                        end else if (request1) begin
                            arb_state_nxt = GNT1;
                            grant_nxt     = 4'b0010;
                        end else if (request2) begin
                            arb_state_nxt = GNT2;
                            grant_nxt     = 4'b0100;
                        end
                    end

                    default: begin
                        // No action
                    end
                endcase
            end

            GNT0: begin
                if (end_transaction0) begin
                    arb_state_nxt    = IDLE;
                    grant_nxt        = 4'd0;
                    serv_history_nxt = 4'b0001;
                end
            end

            GNT1: begin
                if (end_transaction1) begin
                    arb_state_nxt    = IDLE;
                    grant_nxt        = 4'd0;
                    serv_history_nxt = 4'b0010;
                end
            end

            GNT2: begin
                if (end_transaction2) begin
                    arb_state_nxt    = IDLE;
                    grant_nxt        = 4'd0;
                    serv_history_nxt = 4'b0100;
                end
            end

            GNT3: begin
                if (end_transaction3) begin
                    arb_state_nxt    = IDLE;
                    grant_nxt        = 4'd0;
                    serv_history_nxt = 4'b1000;
                end
            end

            default: begin
                // No action
            end
        endcase
    end

endmodule

