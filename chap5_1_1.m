c=-[50,100];
A=[1,1;2,1];
b=[300;400];
lb=[0;0;];
ub=[inf;250];
[x,z]=linprog(c,A,b,[],[],lb,ub)