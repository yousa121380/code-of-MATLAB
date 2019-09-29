clear all; close all; clc
% 解方程（4.2.3） ）
syms i alpha t;
dsolve('Di-alpha*i*(1-i)', 'i(0)=i0', 't')
% 患病人数比例变化率di/dt 与患病人数比例i 的关系
figure; fplot('0.01*x.*(1-x)', [0,1]); grid % alpha=0.01
xlabel(' 患病人数比例 i'); ylabel(' 患病人数比例变化率 di/dt');
% 患病人数比例i 与时间t 的关系（alpha=0.5 ，i0=0.01） ）
figure; ezplot('1/(1-exp(-0.5*t)*(-1+0.01)/0.01)', [0,30]); grid
xlabel(' 时间 t'); ylabel(' 患病人数比例 i')


% clear all; close all; clc
% 解方程（4.2.6） ）
syms i alpha sigma t i0;
i = dsolve('Di=-alpha*i*(i-(1-1/sigma))','i(0)=i0','t');
% 患病人数比例变化率di/dt 与患病人数比例i 的关系（ （sigma=5） ）
figure; fplot('-0.01*x*(x-(1-1/5))', [0,1]); grid % alpha=0.01
hold on; plot([0,1],[0,0],'r-',0.8,0,'ro')
text(0.7,-0.0002,'1-1/\sigma','fontsize',14)
xlabel(' 患病人数比例 i'); ylabel(' 患病人数比例变化率 di/dt');
title('\sigma=5 （\sigma>1 ）','fontsize',16)
% 患病人数比例变化率di/dt 与患病人数比例i 的关系（ （sigma=1/5） ）
figure; fplot('-0.01*x*(x-(1-2))', [0,1]); grid % alpha=0.01
xlabel(' 患病人数比例 i'); ylabel(' 患病人数比例变化率 di/dt');
title('\sigma=1/5 （\sigma<=1 ）','fontsize',16)
% 患病人数比例i 与时间t 的关系（alpha=0.5 ，sigma=0.2 ，i0=0.01） ）
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 0.2, 0.01}), [0, 5]);
xlabel(' 时间 t'); ylabel(' 患病人数比例 i'); axis([0, 5, 0, 0.01])
title('\alpha=0.5, \sigma=0.2, i_0=0.01','fontsize',14); grid
hold on; text(0.1,0.0095,'i_0')
% 患病人数比例i 与时间t 的关系（alpha=0.5 ，sigma=2 ，i0=0.01<1-1/sigma） ）
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 2, 0.01}), [0, 40]);
xlabel(' 时间 t'); ylabel(' 患病人数比例 i'); axis([0, 40, 0, 0.51])
title('\alpha=0.5, \sigma=2, i_0=0.01','fontsize',14); grid
hold on; plot([0,30],[1/2,1/2], 'r--'); text(1,0.48,'1-1/\sigma')
% 患病人数比例i 与时间t 的关系（alpha=0.5 ，sigma=2 ，i0=0.6>1-1/sigma） ）
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 2, 0.6}), [0, 30]);
xlabel(' 时间 t'); ylabel(' 患病人数比例 i'); axis([0, 30, 0.498, 0.6])
title('\alpha=0.5, \sigma=2, i_0=0.6','fontsize',14); grid
hold on; plot([0,30],[1/2,1/2], 'r--'); text(1,0.502,'1-1/\sigma') 

% clear all; close all; clc
a = 1; b = 0.3; % alpha=1, beta=0.3
ts = 0:50; x0 = [0.98, 0.02, 0]; % 时间ts 及s, i, r 的初值
f = @(t,x) [-a*x(1)*x(2), a*x(1)*x(2)-b*x(2), b*x(2)]';
[t, x] = ode45(f, ts, x0);
figure; plot(t, x(:,1), t, x(:,2), t, x(:,3)); grid
legend(' 健康者 s', ' 患病者 i', ' 移出者 r', 'Location', 'East')
xlabel(' 时间 t'); ylabel(' 各类人数所占比例');
figure; plot(x(:,1), x(:,2)); grid
xlabel(' 健康者比例 s'); ylabel(' 患病者比例 i');

% clear all; close all; clc
t0 = 0; tf = 10;
[t,y] = ode45('xt', [t0 tf], [0.1 0.1]); % 初始条件x(0)=0.1,y(0)=0.1
subplot(1,2,1); plot(t, y(:,1), t,y(:,2), 'r'); % 画出x(t), y(t) 曲线图
xlabel('t'); ylabel(' 种群数量'); %gtext('x (t)'); gtext('y(t)'); % 标记
title(' 初值0.1, 0.1 时两种群密度与时间关系'); grid on;
[t2,y2] = ode45('xt', [t0 tf], [1 2]); % 初始条件x(0)=1,y(0)=2
subplot(1,2,2); plot(t2,y2(:,1),t2,y2(:,2),'r'); % 画出x(t),y(t) 曲线图
xlabel(' t'); ylabel(' 种群数量');% gtext('x(t)'); gtext('y(t)'); % 标记
title(' 初值1, 2 时两种群密度与时间关系'); grid on;
% clear all; close all; clc
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


% clear all; close all; clc
t = 1990 : 2010;
x = [114333 115823 117171 118517 119850 121121 122389 ...
123626 124761 125786 126743 127627 128453 129227 ...
129988 130756 131448 132129 132802 133450 134091 ];
tt = 0 : length(x)-1;
xx = log(x(:)');
p = polyfit(tt, xx, 1);
xx = polyval (p, tt);
X = exp(xx);
figure; plot(t, x, 'b.-', t, X, 'r*-')
xlabel(' 年份'); ylabel(' 人口');
legend(' 实际', ' 预测'); grid on


% clear all; close all; clc
x0 = 0.1; xm = 1; r = 0.01;
x = linspace(x0,xm,100); dx = r*x.*(1-x/xm);
figure; plot(x,dx); grid on
xlabel(' 人口数'); ylabel(' 增长率');
set(gca,'xtick',[0.5,1]); set(gca,'ytick',[]);
set(gca,'xticklabel',{'xm/2','xm'})
t = 1:1000; xt = xm./(1+(xm/x0-1)*exp(-r*t));
figure; plot(t,xt); grid on
xlabel(' 时间'); ylabel(' 人口数');
set(gca,'xtick',[]); set(gca,'ytick',[0.5,1])
set(gca,'yticklabel',{'xm/2','xm'})

% clear all; close all; clc
x = [114333 115823 117171 118517 119850 121121 122389 ...
123626 124761 125786 126743 127627 128453 129227 ...
129988 130756 131448 132129 132802 133450 134091 ];
x1 = diff(x)./x(1:end-1);
p = polyfit(x(1:end-1), x1, 1);
r = p(2), s = -p(1), Xm = abs(r/s), X = x(1);
for k=1:length(x)-1
dX = r*X(k)*(1-X(k)/Xm);
X(k+1) = X(k)+dX;
end
plot(1990 : 2010, x, 'b.-', 1990 : 2010, X, 'r*-')
xlabel(' 年份'); ylabel(' 人口'); grid on
legend(' 实际', ' 预测', 'Location', 'North');

% clear all; close all; clc
% %% 读取数据
% x = load(' 中国人口数据（1949—2013 ）.txt');
% t = x(:,1)'; x = x(:,2)';
% N = 1:62; % 用来拟合的数据
% M = 20; % 预测的时间（M 年后）
% tt = 0 : length(t)+M-1;
% %% 指数增长模型
% xx = log(x(:)');
% p = polyfit(tt(N), xx(N), 1);
% xx = polyval (p, tt);
% Y = exp(xx);
% %% 阻滞增长模型
% x1 = diff(x)./x(1:end-1);
% p = polyfit(x(N),x1(N),1);
% r = p(2), s = -p(1), Xm = abs(r/s), X = x(1);
% for k=1:length(tt)-1
% dX = r*X(k)*(1-X(k)/Xm);
% X(k+1) = X(k)+dX;
% end
% %% 显示结果
% figure; plot(t, x, 'b.-', tt+t(1), Y, 'g+-', tt+t(1), X, 'r*-')
% hold on; plot([t(N(end)), t(N(end))], [min(Y), max(Y)], 'r-')
% xlabel(' 年份'); ylabel(' 人口'); grid on
% legend(' 中国实际人口数量', ' 指数增长模型预测', ' 阻滞增长模型预测','Location', 'NorthWest');
% title(' 中国人口预测结果', 'fontsize', 16)