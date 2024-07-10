module dffn (
    Q,D,ck
);
    parameter N = 1;

    input [N-1:0] D;
    input ck;
    output [N-1:0] Q;
    reg [N-1:0] Q;
    initial
        Q = {N{1'b0}};
    always @(negedge ck)
        Q = D;
endmodule
