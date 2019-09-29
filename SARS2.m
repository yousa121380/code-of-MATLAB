clear all; close all; clc
a = 1; b = 0.3; % alpha=1, beta=0.3
ts = 0:50; x0 = [0.98, 0.02, 0]; % 时间ts 及s, i, r 的初值
f = @(t,x) [-a*x(1)*x(2), a*x(1)*x(2)-b*x(2), b*x(2)]';
[t, x] = ode45(f, ts, x0);
figure; plot(t, x(:,1), t, x(:,2), t, x(:,3)); grid
legend(' 健康者 s', ' 患病者 i', ' 移出者 r', 'Location', 'East')
xlabel(' 时间 t'); ylabel(' 各类人数所占比例');
figure; plot(x(:,1), x(:,2)); grid
xlabel(' 健康者比例 s'); ylabel(' 患病者比例 i');