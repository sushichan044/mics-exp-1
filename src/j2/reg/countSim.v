module countSim;
    reg a;
    wire b;

    clk clk1(ck);
    count dut (a,ck,b);

    initial
        begin
        $dumpfile("countSim.vcd");
        $dumpvars(0, countSim);
        $monitor("%b  %b %b  %b  %b", a, ck, b, dut.s1, dut.s2, $stime);
        $display("a ck b s1 s2       time");

        a = 0;
        #100 a = 1;
        #100 a = 0;
        #100 a = 1;
        #100 a = 0;
        #100 a = 1;
        #100 a = 0;
        #100 a = 1;
        #100 a = 0;
        $finish;
        end
endmodule
