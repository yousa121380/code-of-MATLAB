% y1=dsolve('Dy=1/(x+y)','x')
% y2=dsolve('D2y*y-Dy^2=0')
% y3=dsolve('Dy+3*y=8','y(0)=2')
% y4=dsolve('(1+x^2)*D2y-2*x*Dy','y(0)=1','Dy(0)=3')
[x,y]=dsolve('Dx=exp(t)-y-5*x','Dy=x+3*y+exp(2*t)','x(0)=1,y(0)=0','t')
[x,y]=dsolve('Dx=5*cos(t)+2*exp(-2*t)-x-y','Dy=-5*cos(t)+2*exp(-2*t)+x-y','x(0)=2,y(0)=0','t')
[x,y]=dsolve('Dx+3*x+y=0','Dy-3*y-2*x=0','x(0)=3/2,y(0)=0','t')