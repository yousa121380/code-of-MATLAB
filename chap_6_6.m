syms t y(t) x(t);
% e21=[diff(x,t)==-5*x-y+exp(t) diff(y,t)==x+3*y];
% cond=[x(0)==1 y(0)==0];
% e21z=dsolve(e21,cond);
% e21z.x
% e21z.y
% e22=[diff(x,t)==5*cos(t)+2*exp(-2*t)-x-y diff(y,t)==-5*cos(t)+2*exp(-2*t)+x-y];
% cond=[x(0)==2 y(0)==0];
% e22z=dsolve(e22,cond);
% e22z.x
% e22z.y
%e31=[diff(x,t)==y diff(y,t)==3*y-2*x+1];
%conde31=[x(0)==1 y(0)==0];
%e31z=dsolve(e31,conde31);
%e31z.x
%e31z.y
% e32=[diff(y,t)==2*(1-x^2)*y-x diff(x,t)==y];
% conde32=[x(0)==1 y(0)==0];
% e32z=dsolve(e32,conde32);
% e32z.x
% e32z.y
