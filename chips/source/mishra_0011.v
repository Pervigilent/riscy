reg [1:0] cnter, cnter_nxt;
always@(*)
    begin
        // Put all default values here
        cnter_nxt = cnter;

        // Describe the equation in an algorithmic manner
        if (reset_cnter)
            cnter_nxt = 'd0;
        else if (cnter == 2'b11)
            cnter_nxt = 'd0;
        else
            cnter_nxt = cnter + 1'b1;
    end

