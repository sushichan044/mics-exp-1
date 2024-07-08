module count (
    a,ck,b
);
    input a, ck;
    output b;
    wire na;
    wire s1, s2, t;
    wire d1, d2, d3, d4;
    wire e1, e2, e3;
    dffn f1(s1,d1,ck);
    dffn f2(s2,e1,ck);
    assign na = ~a;
    assign ns1 = ~s1;
    assign ns2 = ~s2;

    assign d4 = s1 & ns2, d3 = na & s1, d2 = a & ns1 & s2, d1 = d4 | d3 | d2;
    assign e3 = na & s2, e2 = a & ns2, e1 = e3 | e2;
    assign b = a & s1 & s2;
endmodule
