wire a, b, c, d, e;
assign c = (a & !b) | (!a & b);
assign e = a ? (b & d) : (b | d);

