function A = avoidcircle(W)
[m, n] = size(W);
e = 0;
for i = 1 : n
    for j = i : n
        if W(i, j) ~= 0
            e = e + 1;
            E(e, :) = [i, j, W(i, j)];
        end
    end
end
% 按权值大小排列边的顺序
for i = 1 : e - 1
    for j = i + 1 : e
        if E(i, 3) > E(j, 3)
            temp = E(j, :);
            E(j, :) = E(i,  :);
            E(i, :) = temp;
        end
    end
end
A = zeros(1, 3); S = 1 : n;
for i = 1 : e
    if S(E(i, 1)) ~= S(E(i, 2))
        A = cat(1, A, E(i,:));
        indicator = S(E(i, 1));
        for j = 1 : n
            if S(j) == indicator
                S(j) = S(E(i, 2));
            end
        end
    end
end
A(1, :) = [];
A;