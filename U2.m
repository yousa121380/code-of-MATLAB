clear all; close all; clc
t0 = 0; tf = 10;
[t,y] = ode45('xt', [t0 tf], [0.1 0.1]);
figure; plot(y(:,1), y(:,2), 'b'); hold on;
plot(y(1,1), y(1,2), 'r+');
plot(y(end,1), y(end,2), 'b.');
[t2,y2] = ode45('xt', [t0 tf], [1 2]);
plot(y2(:,1), y2(:,2),'g');
plot(y2(1,1), y2(1,2),'r*');
plot(y2(end,1), y2(end,2), 'ro');
xlabel(' 甲种群x'); ylabel(' 乙种群y');
title(' 甲乙种群相轨线'); grid on;