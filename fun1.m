function dy=fun1(t,y)
dy=zeros(2,1);
dy(1)=exp(t)-5*y(1)-y(2);
dy(2)=3*y(2)+y(1);