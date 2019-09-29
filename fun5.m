function dy=fun5(t,y)
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=(1-y(1)^2)*y(2)-y(1);