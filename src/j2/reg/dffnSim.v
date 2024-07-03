module dffnSim;
    reg i;
    wire o;
    clk clk1(ck);
    dffn dffn1(o, i, ck);
    initial
        begin
        $dumpfile("dffnSim.vcd");
        $dumpvars(0, dffnSim);
        $monitor(" %b %b %b", ck,i,o,$stime);
        $display("ck i o time");
        i = 0;
        #100 i = 1;
        #200 i = 0;
        #100 $finish;
        end
endmodule
