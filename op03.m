function [f,wf]=op03(C,w)
n = length(C);
e = [1, zeros(1, n-1)]; c = repmat(-e, 1, n);
A = repmat(e, 1, n); A(end-n+1:end) = A(end-n+1:end) - 1;
for i = 2:n-1
    e1 = zeros(1, n); e1(i) = 1; e2 = -1*ones(1, n); e2(i) = 0;
    A(i,:) = repmat(e1, 1, n); A(i,(i-1)*n+1:i*n) = e2; 
end
b = zeros(n-1,1);
intcon=1:n*n;
[x, fv ] = intlinprog(c, intcon,[ ], [ ], A, b, zeros(n*n, 1), C(:));
f = reshape(x, n, n);
A = repmat(e, 1, n);
for i = 2:n
    e1 = zeros(1, n); e1(i) = 1; e2 = -1*ones(1, n); e2(i) = 0;
    A(i,:) = repmat(e1, 1, n); A(i,(i-1)*n+1:i*n) = e2; 
end
b = [-fv; zeros(n-2,1); fv ];
[x, gv ] = linprog(w, [ ], [ ], A, b, zeros(n*n, 1), C(:));
wf = reshape(x, n, n); % 最小费用最大流量矩阵