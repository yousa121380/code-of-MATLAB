clear all; close all; clc
t0 = 0; tf = 10;
[t,y] = ode45('xt', [t0 tf], [0.1 0.1]); % 初始条件x(0)=0.1,y(0)=0.1
subplot(1,2,1); plot(t, y(:,1), t,y(:,2), 'r'); % 画出x(t), y(t) 曲线图
xlabel('t'); ylabel(' 种群数量'); gtext('x (t)'); gtext('y(t)'); % 标记
title(' 初值0.1, 0.1 时两种群密度与时间关系'); grid on;
[t2,y2] = ode45('xt', [t0 tf], [1 2]); % 初始条件x(0)=1,y(0)=2
subplot(1,2,2); plot(t2,y2(:,1),t2,y2(:,2),'r'); % 画出x(t),y(t) 曲线图
xlabel(' t'); ylabel(' 种群数量'); gtext('x(t)'); gtext('y(t)'); % 标记
title(' 初值1, 2 时两种群密度与时间关系'); grid on;