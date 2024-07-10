module regNSim ();
    reg l;
    reg [7:0] d;
    clk c1(ck);
    wire [7:0] q;

    regN #8 g1(l, d, ck, q);

    initial begin
        $dumpfile("regN.vcd");
        $dumpvars(0, regNSim);
        $monitor("   %b    %b  %b %b", l, d, ck, q, $stime);
        $display("load        data ck        q      time");


        l = 0;
        d = 8'b00000000;
        #50;

        // pass first data
        l = 1;
        d = 8'b00000011;
        #50;

        // get first data
        l = 0;
        #50;

        // pass second data
        l = 1;
        d = 8'b00001111;

        #50;

        // get second data
        l = 0;
        #50;

        #50 $finish;
    end

endmodule
