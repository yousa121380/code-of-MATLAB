% function x=op04(a)
% n = length(a); a = a+a';
% A = kron(eye(n), ones(1, n));
% A(n+1:2*n, :) = repmat(eye(n), 1, n);
% b = ones(2*n, 1);
% intcon=1:36;
% [x, f ] = intlinprog(a(:),intcon, [ ], [ ], A, b,zeros(36,1),ones(36,1));
% x = reshape(x, n, n);
% clc; clear all;
n = 6; a =zeros(6, 6);
a(1, 2:6) = [56, 35, 21, 51, 60]; a(2, 3:6) = [21, 57, 78, 70];
a(3, 4:6) = [36, 68, 68]; a(4, 5:6) = [51, 61];
a(5, 6) = 13;
a(6,6)=0;
a = a+a';
a=a+10000*eye(6,6);
A = kron(eye(n), ones(1, n));
A(n+1:2*n, :) = repmat(eye(n), 1, n);
b = ones(2*n, 1);
intcon=1:36;
[x, f ] = intlinprog(a(:),intcon, [ ], [ ], A, b,zeros(36,1),ones(36,1));
x = reshape(x, n, n)