function axb(n)
    % 行列 A の次元 n をユーザー指定
    A = create_tridiagonal_matrix(n); % 三重対角行列 A を生成
    % b = create_rhs_vector(n); % 右辺ベクトル b を生成
    b = zeros(n, 1); % 任意の b の値を設定
    for i = 1:n % Aの各行に対してAxを計算してbを生成
        row = A(i,:);
        b(i) = row * (1:n)';
    end

    % 連立一次方程式 Ax = b を解く
    x = A\b;

    x = round(x); % 解 x を整数に丸める
    % 解 x を出力
    disp('解 x:');
    disp(x);

    % 正しい解を生成
    true_solution = (1:n)';
    disp('期待される解:');
    disp(true_solution);

    % 解が正しいか確認
    if isequal(x, true_solution)
        disp('解は正しいです。');
    else
        disp('解は正しくありません。');
    end
end

function A = create_tridiagonal_matrix(n)
    % n次三重対角行列 A を生成
    A = zeros(n);
    for i = 1:n
        if i > 1
            A(i, i-1) = -1; % 右下の要素
        end
        A(i, i) = 2; % 対角要素
        if i < n
            A(i, i+1) = -1; % 左下の要素
        end
    end
end
