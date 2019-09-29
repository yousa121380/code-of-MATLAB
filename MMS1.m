clear
clc
AllTime = 10;
QueneLong=10000;
AvgArriveNum=10;AvgSeverNum=12;
TotalArriveNum = round(AllTime*AvgArriveNum*2);
ArriveEvents = [];
ArriveEvents(1,:) = exprnd(1/AvgArriveNum,1,TotalArriveNum);
ArriveEvents(1,:) = cumsum(ArriveEvents(1,:));
ArriveEvents(2,:) = exprnd(1/AvgSeverNum,1,TotalArriveNum);
len_sim= sum(ArriveEvents(1,:)<=AllTime);
ArriveEvents(3,1) = 0;
ArriveEvents(4,1) = ArriveEvents(1,1)+ArriveEvents(2,1);
ArriveEvents(5,1) = 1;
Member = [1];

for i = 2:TotalArriveNum
    if ArriveEvents(1,i)>AllTime 
        break;
    else
        number = sum(ArriveEvents(4,Member) > ArriveEvents(1,i));
        if number >= QueneLong+1
            ArriveEvents(5,i) = 0;
        else
            if number == 0
                ArriveEvents(3,i) = 0;
                ArriveEvents(4,i) = ArriveEvents(1,i)+ArriveEvents(2,i);
                ArriveEvents(5,i) = 1;
                Member = [Member,i];
            else
                SeverMem = length(Member);
                ArriveEvents(3,i)=ArriveEvents(4,Member(SeverMem))-ArriveEvents(1,i);
                ArriveEvents(4,i)=ArriveEvents(4,Member(SeverMem))+ArriveEvents(2,i);
                ArriveEvents(5,i) = number+1;
                Member = [Member,i];
            end
        end
        
    end
end
SeverMem = length(Member);
stairs([0 ArriveEvents(1,Member)],0:SeverMem);
hold on;
stairs([0 ArriveEvents(4,Member)],0:SeverMem,'.-b');
legend('到达时间 ','离开时间 ');
hold off;
grid on;
figure;
plot(1:SeverMem,ArriveEvents(3,Member),'-*b',1: SeverMem,ArriveEvents(2,Member)+ArriveEvents(3,Member),'k-');
legend('等待时间 ','停留时间 ');
grid on;