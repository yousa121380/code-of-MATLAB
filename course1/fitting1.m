[X,text]=xlsread('C:\Users\lianxiang\Desktop\x1.xlsx');
XX=X;
X(:,4)=[];
x=X(1,:);
y=X(2,:);
y2=X(3,:);
[p,S]= polyfit(x,y,5); 
[p1,S1]= polyfit(x,y2,5); 
%S是拟合的误差，7是多项式项数 
x1=linspace(0,7,100);
y1 = polyval(p,x1);
x3=linspace(0,7,100);
y3= polyval(p1,x3,5);
x4=0:7;
y4=ones(1,8);
x=XX(1,:);
y=XX(2,:);
y2=XX(3,:);
figure
p1=plot(x,y,'o');
hold on
p2=plot(x,y2,'*');
p3=plot(x1,y1);
p5=plot(x3,y3);
p6=plot(x4,y4);
xlabel('时间序号');ylabel('热度指标');
axis([0,8,-0.1,1.1])
legend([p1 p3 p2 p5 p6],'A题数据点','A题拟合曲线','B题数据点','B题拟合曲线','热度指标线')
hold off
% x= [8,10,12,14,16,18,20,22,24,26,27,28,30,32,34,36,38,40];
% y= [0.49,0.48,0.46,0.43,0.44,0.46,0.42,0.41,0.42,0.41,0.40,...
%     0.40,0.41,0.40,0.40,0.42,0.38,0.39];
% myfun = @(a,x) a(1)+(0.49-a(1))*exp(-a(2)*(x-8));
% x0 = [0.1, 0.01];
% [a,resnorm,residual,exitflag,output] =lsqcurvefit(myfun, x0, x, y)
% %依次是系数，回归平方和，每个点回归平方
% x2 = 8:40; 
% y2 = a(1)+(0.49-a(1))*exp(-a(2)*(x2-8));
% figure; 
% plot(x, y, 'bo', x2, y2, 'r-')
% load hald 
% stepwise(ingredients, heat) % 逐步回归