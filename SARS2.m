clear all; close all; clc
a = 1; b = 0.3; % alpha=1, beta=0.3
ts = 0:50; x0 = [0.98, 0.02, 0]; % ʱ��ts ��s, i, r �ĳ�ֵ
f = @(t,x) [-a*x(1)*x(2), a*x(1)*x(2)-b*x(2), b*x(2)]';
[t, x] = ode45(f, ts, x0);
figure; plot(t, x(:,1), t, x(:,2), t, x(:,3)); grid
legend(' ������ s', ' ������ i', ' �Ƴ��� r', 'Location', 'East')
xlabel(' ʱ�� t'); ylabel(' ����������ռ����');
figure; plot(x(:,1), x(:,2)); grid
xlabel(' �����߱��� s'); ylabel(' �����߱��� i');