function [b,k,a]=Gompert1()
t=[2,3,4,5,6,7,8,9,10];
y=[4.9,6.02,7.00,7.50,8.10,8.25,8.51,9.27,10.23];
m=max(size(t))/3;
sy=sum(log(reshape(y,m,3)))/m;
b=((sy(3)-sy(2))/(sy(2)-sy(1)))^(1/m);
tk=(sy(1)*b^m-sy(2))/(b^m-1);
ta=(sy(2)-sy(1))/(b^((m+1)/2)*(b^m-1));
k=exp(tk);
a=exp(ta);
