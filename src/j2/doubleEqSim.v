module doubleEqSim; /* 一致検出回路の */
    wire s; /* シミュレーション */
    reg a, b, c, d;
    doubleEq g1(s, a, b, c, d);
    initial
        begin
        $dumpfile("doubleEq.vcd");
        $dumpvars(0, doubleEqSim);
        $monitor(" %b %b %b %b %b %b  %b", a, b, c, d, s, g1.w1, g1.w2, $stime);
        $display(" a b c d s w1 w2       time");
        /* test all case */
        a=0; b=0; c=0; d=0;
        #50 a=0; b=0; c=0; d=1;
        #50 a=0; b=0; c=1; d=0;
        #50 a=0; b=0; c=1; d=1;
        #50 a=0; b=1; c=0; d=0;
        #50 a=0; b=1; c=0; d=1;
        #50 a=0; b=1; c=1; d=0;
        #50 a=0; b=1; c=1; d=1;
        #50 a=1; b=0; c=0; d=0;
        #50 a=1; b=0; c=0; d=1;
        #50 a=1; b=0; c=1; d=0;
        #50 a=1; b=0; c=1; d=1;
        #50 a=1; b=1; c=0; d=0;
        #50 a=1; b=1; c=0; d=1;
        #50 a=1; b=1; c=1; d=0;
        #50 a=1; b=1; c=1; d=1;
        end
endmodule
