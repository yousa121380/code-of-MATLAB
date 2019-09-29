clc;clear all;close all;
f=-[50 100];
A=[1 1
    2 1
    0 1];
b=[300 400 250];
lb=[0 0];
ub=[inf inf];
a=linprog(f,A,b,[],[],lb,ub)
f=[1 2 3];
A=[-2 1 -1
    1 1 2
    0 -1 1];
b=[-4 8 -2];
lb=[0 0 0 ];
ub=[inf inf inf];
a=linprog(f,A,b,[],[],lb,ub)
f=-[5 2 4];
A=[-3 -1 -2
    -6 -3 -5];
b=[-2 -10];
lb=[0 0 0];
ub=[inf inf inf];
a=linprog(f,A,b,[],[],lb,ub)
