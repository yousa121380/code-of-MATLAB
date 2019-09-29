function [s,r,f]=STE(t,y,sy)
T=max(size(t));
s=sqrt(sum((y-sy).^2)/T);
r=sqrt(sum((y-sy).^2)/sum(y.^2));
f=sum(y.*sy)/(sqrt(sum(y.^2)).*sqrt(sum(sy.^2)));