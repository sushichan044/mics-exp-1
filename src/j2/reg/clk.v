module clk (
    ck
);
    output ck;
    reg ck;
    initial ck = 0;
    always #50 ck = ~ck;
endmodule
