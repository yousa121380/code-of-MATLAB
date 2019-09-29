function y=op01(W)
%0- -1 规划模型的MATLAB 程序
n = length(W); 
A = zeros(n, n*n);
intcon=1:n*n;
for i = 1:n
    e1 = zeros(1, n);
    e1(i) = 1;
    e2 = -1*ones(1, n);
    e2(i) = 0;
    A(i, :) = repmat(e1, 1, n);
    A(i, (i-1)*n+1:i*n) = e2;
end
b = zeros(n, 1);
b(1) = 1;
b(end) = -1;
lb=zeros(n*n,1);
ub=ones(n*n,1);
x = intlinprog(W(:),intcon,[],[],A,b,lb,ub);
y = reshape(x, n, n);