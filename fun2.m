function dy=fun2(t,y)
dy=zeros(2,1);
dy(1)=5*cos(t)+2*exp(-2*t)-y(1)-y(2);
dy(2)=-5*cos(t)+2*exp(-2*t)+y(1)-y(2);