reg       b, c;
reg [1:0] cnter;
reg [1:0] cnter_nxt;

assign cntr_nxt = (cntr == 2'b11) ? 2'b00: (cntr + 1'b1);

always @(posedge clk or negedge rstb)
    begin
        if (!rstb)
            begin
                b <= 1'b1;
                c <= 1'b0;
                cnter <= 'd0;
            end
        else
            begin
                b <= a;
                c <= b;
                cnter <= cnter_nxt;
            end
    end
