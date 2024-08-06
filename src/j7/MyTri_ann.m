function [x, y, e2n] = MyTri_ann(lx, ly, nx, ny)
    % 矩形領域の長さ lx, ly と分割数 nx, ny に基づいて三角形の分割を行う
    % 出力:
    % x: 節点の x 座標
    % y: 節点の y 座標
    % e2n: 要素・節点対応表

    % 総節点数の計算
    N = (nx + 1) * (ny + 1);  % 節点数
    x = zeros(N, 1);          % x座標配列
    y = zeros(N, 1);          % y座標配列

    % 節点座標の設定
    for j = 0:ny
        r = lx + (ly - lx) * j / ny;
        for i = 0:nx
            theta = 2 * pi * i / nx / 4;
            nodeIndex = j * (nx + 1) + i + 1;
            x(nodeIndex) = r * cos(theta);    % x座標
            y(nodeIndex) = r * sin(theta);    % y座標
        end
    end

    % 総要素数の計算
    M = nx * ny * 2;  % 各四角形を2つの三角形に分割
    e2n = zeros(M, 3); % 要素・節点対応表の初期化

    % 要素・節点対応表の設定
    elemIndex = 1;
    for j = 1:ny
        for i = 1:nx
            % 四角形の頂点を取得
            n1 = (j - 1) * (nx + 1) + i;      % 左下
            n2 = n1 + 1;                      % 右下
            n3 = n1 + (nx + 1);               % 左上
            n4 = n2 + (nx + 1);               % 右上

            % 三角形1
            e2n(elemIndex, :) = [n1, n2, n3];
            elemIndex = elemIndex + 1;
            % 三角形2
            e2n(elemIndex, :) = [n2, n4, n3];
            elemIndex = elemIndex + 1;
        end
    end
end
