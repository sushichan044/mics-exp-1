module sample1_test;
    wire z;
    reg x, y;
    sample1 g1(z, x, y);
    initial /* イベントの生成 */
        begin
        $dumpfile("sample1.vcd");
        $dumpvars(0, sample1_test);
        $monitor(" %b %b %b", x, y, z, $stime);
        $display(" x y z time");
        x=0; y=0; /* 0サイクル目 */
        #50 y=1; /* 50サイクル目 */
        #50 x=1; y=0; /* 100サイクル目 */
        #50 y=1; /* 150サイクル目 */
        #50 $finish; /* 200サイクル目 */
        end
endmodule
