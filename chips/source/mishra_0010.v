input  reset_cnter;
reg [1:0] cnter, cnter_nxt;

assign cnter_nxt = reset_cnter ? 2'b00 : ((cnter == 2'b11) ? 2'b00: (cnter + 1));

always @(posedge clk)
    begin
        cnter <= cnter_nxt;
    end

