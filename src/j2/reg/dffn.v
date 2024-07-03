module dffn (
    Q,D,ck
);
    input D, ck;
    output Q;
    reg Q;
    initial Q = 0;
    always @(negedge ck)
        Q = D;
endmodule
