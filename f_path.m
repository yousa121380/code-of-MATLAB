function [P, u] = f_path(W)
% W 表示权值矩阵; P 表示最短路; % u 表示最短路的权和
n = length(W); U = W; k = 1; % Step1 初始化
% Step2
while k<=n
    for i=1:n
        for j=1:n
            if U(i, j) > U(i, k) + U(k, j)
                U(i, j) = U(i, k) + U(k, j);
            end;
        end; 
    end
k = k+1;
end
u = U(1, n);
% 输出最短路的顶点
P1 = zeros(1,n); k = 1; P1(k) = n; V = ones(1,n)*inf; kk = n;
while kk~=1
    for i=1:n
        V(1, i) = U(1, kk) - W(i, kk);
        if V(1, i)==U(1, i)
            P1(k+1) = i; kk = i; k = k+1;
        end; 
    end;
end
k = 1; wrow = find(P1~=0);
for j=length(wrow) : (-1) : 1
    P(k) = P1(wrow(j)); k = k+1;
end