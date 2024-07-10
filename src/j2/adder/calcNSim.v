module calcNSim (

);
    reg [7:0] a, b;
    reg k;
    wire [7:0] sum;
    wire cu;
    calcN #8 g1(a, b, sum, k, cu);

    initial begin
        $dumpfile("calcN.vcd");
        $dumpvars(0, calcNSim);
        $monitor(" %b  %b  %b  %b  %b", a, b, k, sum, cu, $stime);
        $display("        a         b  k       sum  cu      time");

        // test add
        a = 8'b00000011;
        b = 8'b00000011;
        k = 0;

        // test sub
        #10;
        a = 8'b00000011;
        b = 8'b00000011;
        k = 1;

        #10;

        // test add overflow
        a = 8'b11111111;
        b = 8'b00000001;
        k = 0;

        #10;

        // test sub overflow
        a = 8'b00000000;
        b = 8'b00000001;
        k = 1;

        #10 $finish;
    end
endmodule
