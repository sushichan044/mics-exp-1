module sample1(s, a, b); /* モジュール名(入出力端子) */
    input a, b; /* 入力端子a, bの宣言 */
    output s; /* 出力端子sの宣言 */
    assign s = a & b; /* s に a (and) b を接続 */
endmodule
