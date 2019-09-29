clc;
clear all;
close all;
[t,y]=ode45(@fun2,[0,1],[2;0]);
plot(t,y(1),'-',t,y(2),'.-')