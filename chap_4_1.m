clear all; close all; clc
% �ⷽ�̣�4.2.3�� ��
syms i alpha t;
dsolve('Di-alpha*i*(1-i)', 'i(0)=i0', 't')
% �������������仯��di/dt �뻼����������i �Ĺ�ϵ
figure; fplot('0.01*x.*(1-x)', [0,1]); grid % alpha=0.01
xlabel(' ������������ i'); ylabel(' �������������仯�� di/dt');
% ������������i ��ʱ��t �Ĺ�ϵ��alpha=0.5 ��i0=0.01�� ��
figure; ezplot('1/(1-exp(-0.5*t)*(-1+0.01)/0.01)', [0,30]); grid
xlabel(' ʱ�� t'); ylabel(' ������������ i')


% clear all; close all; clc
% �ⷽ�̣�4.2.6�� ��
syms i alpha sigma t i0;
i = dsolve('Di=-alpha*i*(i-(1-1/sigma))','i(0)=i0','t');
% �������������仯��di/dt �뻼����������i �Ĺ�ϵ�� ��sigma=5�� ��
figure; fplot('-0.01*x*(x-(1-1/5))', [0,1]); grid % alpha=0.01
hold on; plot([0,1],[0,0],'r-',0.8,0,'ro')
text(0.7,-0.0002,'1-1/\sigma','fontsize',14)
xlabel(' ������������ i'); ylabel(' �������������仯�� di/dt');
title('\sigma=5 ��\sigma>1 ��','fontsize',16)
% �������������仯��di/dt �뻼����������i �Ĺ�ϵ�� ��sigma=1/5�� ��
figure; fplot('-0.01*x*(x-(1-2))', [0,1]); grid % alpha=0.01
xlabel(' ������������ i'); ylabel(' �������������仯�� di/dt');
title('\sigma=1/5 ��\sigma<=1 ��','fontsize',16)
% ������������i ��ʱ��t �Ĺ�ϵ��alpha=0.5 ��sigma=0.2 ��i0=0.01�� ��
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 0.2, 0.01}), [0, 5]);
xlabel(' ʱ�� t'); ylabel(' ������������ i'); axis([0, 5, 0, 0.01])
title('\alpha=0.5, \sigma=0.2, i_0=0.01','fontsize',14); grid
hold on; text(0.1,0.0095,'i_0')
% ������������i ��ʱ��t �Ĺ�ϵ��alpha=0.5 ��sigma=2 ��i0=0.01<1-1/sigma�� ��
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 2, 0.01}), [0, 40]);
xlabel(' ʱ�� t'); ylabel(' ������������ i'); axis([0, 40, 0, 0.51])
title('\alpha=0.5, \sigma=2, i_0=0.01','fontsize',14); grid
hold on; plot([0,30],[1/2,1/2], 'r--'); text(1,0.48,'1-1/\sigma')
% ������������i ��ʱ��t �Ĺ�ϵ��alpha=0.5 ��sigma=2 ��i0=0.6>1-1/sigma�� ��
figure; ezplot(subs(i, {alpha, sigma, i0}, {0.5, 2, 0.6}), [0, 30]);
xlabel(' ʱ�� t'); ylabel(' ������������ i'); axis([0, 30, 0.498, 0.6])
title('\alpha=0.5, \sigma=2, i_0=0.6','fontsize',14); grid
hold on; plot([0,30],[1/2,1/2], 'r--'); text(1,0.502,'1-1/\sigma') 

% clear all; close all; clc
a = 1; b = 0.3; % alpha=1, beta=0.3
ts = 0:50; x0 = [0.98, 0.02, 0]; % ʱ��ts ��s, i, r �ĳ�ֵ
f = @(t,x) [-a*x(1)*x(2), a*x(1)*x(2)-b*x(2), b*x(2)]';
[t, x] = ode45(f, ts, x0);
figure; plot(t, x(:,1), t, x(:,2), t, x(:,3)); grid
legend(' ������ s', ' ������ i', ' �Ƴ��� r', 'Location', 'East')
xlabel(' ʱ�� t'); ylabel(' ����������ռ����');
figure; plot(x(:,1), x(:,2)); grid
xlabel(' �����߱��� s'); ylabel(' �����߱��� i');

% clear all; close all; clc
t0 = 0; tf = 10;
[t,y] = ode45('xt', [t0 tf], [0.1 0.1]); % ��ʼ����x(0)=0.1,y(0)=0.1
subplot(1,2,1); plot(t, y(:,1), t,y(:,2), 'r'); % ����x(t), y(t) ����ͼ
xlabel('t'); ylabel(' ��Ⱥ����'); %gtext('x (t)'); gtext('y(t)'); % ���
title(' ��ֵ0.1, 0.1 ʱ����Ⱥ�ܶ���ʱ���ϵ'); grid on;
[t2,y2] = ode45('xt', [t0 tf], [1 2]); % ��ʼ����x(0)=1,y(0)=2
subplot(1,2,2); plot(t2,y2(:,1),t2,y2(:,2),'r'); % ����x(t),y(t) ����ͼ
xlabel(' t'); ylabel(' ��Ⱥ����');% gtext('x(t)'); gtext('y(t)'); % ���
title(' ��ֵ1, 2 ʱ����Ⱥ�ܶ���ʱ���ϵ'); grid on;
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
xlabel(' ����Ⱥx'); ylabel(' ����Ⱥy');
title(' ������Ⱥ�����'); grid on;


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
xlabel(' ���'); ylabel(' �˿�');
legend(' ʵ��', ' Ԥ��'); grid on


% clear all; close all; clc
x0 = 0.1; xm = 1; r = 0.01;
x = linspace(x0,xm,100); dx = r*x.*(1-x/xm);
figure; plot(x,dx); grid on
xlabel(' �˿���'); ylabel(' ������');
set(gca,'xtick',[0.5,1]); set(gca,'ytick',[]);
set(gca,'xticklabel',{'xm/2','xm'})
t = 1:1000; xt = xm./(1+(xm/x0-1)*exp(-r*t));
figure; plot(t,xt); grid on
xlabel(' ʱ��'); ylabel(' �˿���');
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
xlabel(' ���'); ylabel(' �˿�'); grid on
legend(' ʵ��', ' Ԥ��', 'Location', 'North');

% clear all; close all; clc
% %% ��ȡ����
% x = load(' �й��˿����ݣ�1949��2013 ��.txt');
% t = x(:,1)'; x = x(:,2)';
% N = 1:62; % ������ϵ�����
% M = 20; % Ԥ���ʱ�䣨M ���
% tt = 0 : length(t)+M-1;
% %% ָ������ģ��
% xx = log(x(:)');
% p = polyfit(tt(N), xx(N), 1);
% xx = polyval (p, tt);
% Y = exp(xx);
% %% ��������ģ��
% x1 = diff(x)./x(1:end-1);
% p = polyfit(x(N),x1(N),1);
% r = p(2), s = -p(1), Xm = abs(r/s), X = x(1);
% for k=1:length(tt)-1
% dX = r*X(k)*(1-X(k)/Xm);
% X(k+1) = X(k)+dX;
% end
% %% ��ʾ���
% figure; plot(t, x, 'b.-', tt+t(1), Y, 'g+-', tt+t(1), X, 'r*-')
% hold on; plot([t(N(end)), t(N(end))], [min(Y), max(Y)], 'r-')
% xlabel(' ���'); ylabel(' �˿�'); grid on
% legend(' �й�ʵ���˿�����', ' ָ������ģ��Ԥ��', ' ��������ģ��Ԥ��','Location', 'NorthWest');
% title(' �й��˿�Ԥ����', 'fontsize', 16)