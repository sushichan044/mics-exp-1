module addN (
    a, b, sum, ci, cu
);
    parameter N = 8;

    input [N-1:0] a, b;
    input ci;
    output [N-1:0] sum;
    output cu;

    wire [N-1:0] sum;
    wire [N:0] c; // carries
    assign c[0] = ci;


    assign sum = a ^ b ^ c[N-1:0];
    assign c[N:1] = (a & b) | (b & c[N-1:0]) | (a & c[N-1:0]);


    assign cu = c[N];
endmodule
