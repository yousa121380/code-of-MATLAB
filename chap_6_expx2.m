clear all;
close all;
clc
n=[100,500,1000,5000,10000,10000];
for i=1:length(n)
    for j=1:1000
        X=rand(1,n(i));
        Y=rand(1,n(i))*exp(1);
        d=Y-exp(X.^2);
        k(j,i)=sum(d<=0);
    end
end
I=mean(k)./n*exp(1)