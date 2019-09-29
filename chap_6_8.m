[t,y]=ode45(@fun5,0:0.001:5,[-0.5;0]);
subplot(2,1,1);
plot(t,y(1),'-',t,y(2),'.-')
subplot(2,1,2);
plot(y(1),y(2),'b')