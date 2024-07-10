module dffnSim;
    reg[1:0] i;
    wire[1:0] o;
    clk clk1(ck);
    dffn #2 dffn1(o, i, ck);
    initial
        begin
        $dumpfile("dffnSim.vcd");
        $dumpvars(0, dffnSim);
        $monitor(" %b %b %b", ck,i,o,$stime);
        $display("ck  i  o      time");
        i = 2'b00;
        #100 i = 2'b01;
        #200 i = 2'b10;
        #100 $finish;
        end
endmodule
