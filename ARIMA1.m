Data=xlsread('C:\\Users\\lianxiang\\Desktop\\data.xlsx');
Data(:,2)=[];Data(:,2)=[];Data(:,1)=[];
TheData=Data(1:49,1);
step=6;
TheTemp=TheData;
TheTemp=detrend(TheTemp);
Trend=TheData-TheTemp;
H=adftest(TheTemp);
TheDiff=0;
DiffData=[];
while ~H
    DiffData=[DiffData,TheTemp(1,1)];
    TheTemp=diff(TheTemp);
    TheDiff=TheDiff+1;
    H=adftest(TheTemp);
end
TheObject = iddata(TheTemp);
Test= [];
for i = 1:5
    for j = 1:5
        m = armax(TheObject,[i j]);
        TheAIC = aic(m);
        Test = [Test;i j TheAIC];
    end
end
Test1=[];
for i=1:5
    for j=1:5
        for k = 1:size(Test,1)
            if Test(k,3) == min(Test(:,3)) %选择AIC值最小的模型
                m = armax(TheObject,[i j]);
                ITest = Test(k,1);
                ITest = Test(k,2);
                Max1 = armax(TheObject,[ITest ITest]);
                TheAIC = aic(m);
                TheBIC = aic(Max1);
                Test1=[Test1;i j ITest ITest TheAIC TheBIC ];
                break;
            end
        end
    end 
end 
TheTemp=[TheTemp;zeros(step,1)];
n=iddata(TheTemp);
m = armax(TheObject,[ITest ITest]);
P1=predict(m,n,1);
Predict=P1.OutputData;
Predict=Predict';
if size(DiffData,2)~=0
    for index=size(DiffData,2):-1:1
        Predict=cumsum([DiffData(index),Predict]);
    end
end
mp1=polyfit([1:size(Trend',2)],Trend',1);
xt=[];
for j=1:step
    xt=[xt,size(Trend',2)+j];
end
TheResultTrend=polyval(mp1,xt);
PreData=TheResultTrend+Predict(size(TheData',2)+1:size(Predict,2));
tempx=[Trend',TheResultTrend]+Predict;
plot(Data,'g');
hold on;
plot(tempx,'r')
% figure(1)
% subplot(2,2,1),plot(tempx,'r');
% hold on;grid on;
% title('预测值');
% xlabel('时刻');ylabel('出机场人数');
% subplot(2,2,2);
% plot(Data,'b');
% hold on;grid on;
% title('实际值');
% xlabel('时刻');ylabel('出机场人数');
% %figure(3)
% t=tempx';
% erro=abs(Data-t);
% subplot(2,2,3),plot(erro,'g');%误差值
% hold on
% grid;
% title('绝对误差值');
% xlabel('时刻/时');ylabel('人数');
% t=tempx';
% erro=abs(Data-t);
% Erro=(erro/Data)*100;
% subplot(2,2,4),plot(Erro,'g');%误差值
% hold on
% grid;
% title('相对误差值');
% xlabel('时刻/时');ylabel('百分比/%'); 