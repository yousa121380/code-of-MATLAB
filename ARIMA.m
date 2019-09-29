y=[ 842.760000000000 871.460000000000  882.460000000000  977.830000000000 836.960000000000 816.960000000000 ...
    803.390000000000 849.050000000000 822.230000000000 828.120000000000 857.100000000000 868.930000000000 ...
    874.240000000000 863.710000000000 867.940000000000 863.070000000000 890.460000000000 866.580000000000 ...
    874.530000000000 864.900000000000 873.730000000000 864.900000000000 852.420000000000 881.150000000000 ...
    866.090000000000 885.250000000000 868.380000000000 860.030000000000 848.830000000000 838.300000000000 ...
    869.140000000000 868.900000000000 858.300000000000 828.300000000000 806.330000000000 841.620000000000 ...
    847.830000000000 862.340000000000 850.690000000000 850.720000000000 825.410000000000 833.610000000000 ...
    842.100000000000 854.890000000000 846.680000000000 842.090000000000 845.230000000000 871.490000000000 ...
    868.320000000000 856.340000000000 863.130000000000 863.560000000000 842.170000000000 827.260000000000 ...
    828.810000000000];
Data=y';
SourceData=Data(1:49,1);
step=6;
TempData=SourceData;
TempData=detrend(TempData);%去趋势线
TrendData=SourceData-TempData;%趋势函数
%--------差分，平稳化时间序列---------
H=adftest(TempData);
difftime=0;
SaveDiffData=[];
while ~H
    SaveDiffData=[SaveDiffData,TempData(1,1)];
    TempData=diff(TempData);%差分，平稳化时间序列
    difftime=difftime+1;%差分次数
    H=adftest(TempData);%adf检验，判断时间序列是否平稳化
end
%---------模型定阶或识别--------------
TheObject = iddata(TempData);
test = [];
for p = 1:5%自回归对应PACF,给定滞后长度上限p和q，一般取为T/10、ln(T)或T^(1/2),这里取T/10=12
    for q = 1:5%移动平均对应ACF
        m = armax(TheObject,[p q]);%
        AIC = aic(m);%armax(p,q),计算AIC
        test = [test;p q AIC];
    end
end
test1=[];


for p=1:5
    for q=1:5
        for k = 1:size(test,1)
            if test(k,3) == min(test(:,3)) %选择AIC值最小的模型
                p_test = test(k,1);
                q_test = test(k,2);
                
                m = armax(TheObject,[p q]);
                AIC = aic(m);
                m1 = armax(TheObject,[p_test q_test]);
                BIC = aic(m1);
                test1=[test1;p q p_test q_test AIC BIC ];
                
                break;
            end
        end
        
    end 
end 
%------1阶预测-----------------
TempData=[TempData;zeros(step,1)];
n=iddata(TempData);
%p_test=1;q_test=2;
m = armax(TheObject,[p_test q_test]);
%m = armax(u(1:ls),[p_test q_test]);? ?? ???%armax(p,q),[p_test q_test]对应AIC值最小，自动回归滑动平均模型
P1=predict(m,n,1);
PreR=P1.OutputData;
PreR=PreR';
%----------还原差分-----------------
if size(SaveDiffData,2)~=0
    for index=size(SaveDiffData,2):-1:1
        PreR=cumsum([SaveDiffData(index),PreR]);
    end
end
%-------------------预测趋势并返回结果----------------
mp1=polyfit([1:size(TrendData',2)],TrendData',1);
xt=[];
for j=1:step
    xt=[xt,size(TrendData',2)+j];
end
TrendResult=polyval(mp1,xt);
PreData=TrendResult+PreR(size(SourceData',2)+1:size(PreR,2));
tempx=[TrendData',TrendResult]+PreR;% tempx为预测结果
figure(1)
%plot(tempx,'r');%红线预测值
subplot(2,2,1),plot(tempx,'r');%红线预测值;
hold on
grid;
title('预测值');
xlabel('天数/天');ylabel('水量/万吨');
%figure(2)
subplot(2,2,2),plot(Data,'b');%蓝色线实际值
hold on
grid;
title('实际值');
xlabel('天数/天');ylabel('水量/万吨');
%figure(3)
t=tempx';
erro=abs(Data-t);
subplot(2,2,3),plot(erro,'g');%误差值
hold on
grid;
title('绝对误差值');
xlabel('天数/天');ylabel('水量/万吨');
h = 0.001;   %  步长，取不同的值，结果会有变化
x = -30:h:30;
z1 = abs(Data-t);
zmax1 = max(z1);  %  最大绝对误差的值
zpjun1=mean(z1) ;%  平均绝对误差的值
%figure(4)
t=tempx';
erro=abs(Data-t);
Erro=(erro/Data)*100;
subplot(2,2,4),plot(Erro,'g');%误差值
hold on
grid;
title('相对误差值');
xlabel('天数/天');ylabel('百分比/%');
h = 0.001;   %  步长，取不同的值，结果会有变化
x = h:1;
z2 = abs((Data-t)/Data);
zmax2 = max(z2) ; %  最大相对误差的值
zpjun2=mean(z2);  %  平均相对误差的值
%plot(tempx,'r');%红线预测值
%hold on
%plot(Data,'b');%蓝色线实际值
%hold on;
%t=tempx';
%erro=Data-t;

%plot(erro,'g');
%hold on;