clear all; close all; clc
t0 = 0; tf = 10;
[t,y] = ode45('xt', [t0 tf], [0.1 0.1]); % ��ʼ����x(0)=0.1,y(0)=0.1
subplot(1,2,1); plot(t, y(:,1), t,y(:,2), 'r'); % ����x(t), y(t) ����ͼ
xlabel('t'); ylabel(' ��Ⱥ����'); gtext('x (t)'); gtext('y(t)'); % ���
title(' ��ֵ0.1, 0.1 ʱ����Ⱥ�ܶ���ʱ���ϵ'); grid on;
[t2,y2] = ode45('xt', [t0 tf], [1 2]); % ��ʼ����x(0)=1,y(0)=2
subplot(1,2,2); plot(t2,y2(:,1),t2,y2(:,2),'r'); % ����x(t),y(t) ����ͼ
xlabel(' t'); ylabel(' ��Ⱥ����'); gtext('x(t)'); gtext('y(t)'); % ���
title(' ��ֵ1, 2 ʱ����Ⱥ�ܶ���ʱ���ϵ'); grid on;