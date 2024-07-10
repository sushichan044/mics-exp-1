module calcN (
    a, b, sum, k, cu
);
    parameter N = 8;

    input [N-1:0] a, b;
    input k;
    output [N-1:0] sum;
    output cu;

    wire[N-1:0] B = k ? ~b : b;
    addN #(
        .N(N)
    ) g1(a, B, sum, k, cu);

endmodule
