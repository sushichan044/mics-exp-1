module doubleEq(
    s,a,b,c,d
);
    input a, b, c, d;
    output s;
    wire w1, w2;
    eq m1(w1, a, b);
    eq m2(w2, c, d);
    assign s = w1 & w2;
endmodule
