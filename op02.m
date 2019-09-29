function x=op02(u)
n =length(u);
e = [1, zeros(1, n-1)]; c = repmat(-e, 1, n);
A = repmat(e, 1, n); A(end-n+1:end) = A(end-n+1:end) - 1;
for i = 2:n-1
    e1 = zeros(1, n); e1(i) = 1; e2 = -1*ones(1, n); e2(i) = 0;
    A(i,:) = repmat(e1, 1, n); A(i,(i-1)*n+1:i*n) = e2; 
end
b = zeros(n-1,1);
intcon=1:36;
[x, f ] = intlinprog(c,intcon, [ ], [ ], A, b, zeros(n*n, 1), u(:));
x = reshape(x, n, n); % ×îºóµÄf