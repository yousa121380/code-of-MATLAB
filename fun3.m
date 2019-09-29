function dy=fun3(t,y)
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=3*y(2)-2*y(1)+1;
