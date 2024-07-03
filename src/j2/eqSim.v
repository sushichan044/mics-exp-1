module eqSim; /* 一致検出回路の */
    wire s; /* シミュレーション */
    reg x, y;
    eq g1(s, x, y);
    initial
        begin
        $dumpfile("eq.vcd");
        $dumpvars(0, eqSim);
        $monitor(" %b %b  %b  %b %b", x, y,  g1.s1, g1.s2,s, $stime);
        $display(" x y s1 s2 s       time");
        x=0; y=0;
        #50 y=1;
        #50 x=1; y=0;
        #50 y=1;
        #50 $finish;
        end
endmodule
