module addNSim (

);
    reg [7:0] a, b;
    reg ci;
    wire [7:0] sum;
    wire cu;
    addN #8 g1(a, b, sum, ci, cu);

    initial begin
        $dumpfile("addN.vcd");
        $dumpvars(0, addNSim);
        $monitor(" %b  %b    %b  %b   %b", a, b,ci, sum, cu, $stime);
        $display("        a         b   ci       sum  cu      time");

        // test normal
        a = 8'b00000011;
        b = 8'b00000011;
        ci = 0;

        // test carry in(下の位から繰り上がることはないが念の為)
        #10;
        a = 8'b00000011;
        b = 8'b00000011;
        ci = 1;

        #10;
        // test overflow
        a = 8'b11111111;
        b = 8'b00000001;
        ci = 0;

        #10 $finish;
    end

endmodule
