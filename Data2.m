data=xlsread('C:\Users\lianxiang\Documents\x1.xlsx');
p=polyfit(1:length(data),data',5);
x1=1:length(data);
y1=polyval(p,x1);
t=(hours(11)+minutes(30)):minutes(1):(hours(12)+minutes(58));
plot(t,data','.','DurationTickFormat','hh:mm');
hold on;
plot(t,y1,'DurationTickFormat','hh:mm')
legend('客流计数摄像机统计值','分段拟合的曲线');