module regN (
    l, d, ck, q
);
    parameter N = 8;

    input l;
    input [N-1:0] d;
    input ck;
    output [N-1:0] q;
    wire [N-1:0] d1;

    dffn #8 f1(q,d1,ck);
    assign d1 = l ? d : q;

endmodule
