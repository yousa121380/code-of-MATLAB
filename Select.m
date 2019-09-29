AreaWidth1=121.329515;AreaWidth2=121.359555; %
AreaHeight1=31.184995;AreaHeight2=31.222801; %
% AreaWidth1=121.763102;AreaWidth2=121.892458; %
% AreaHeight1=31.112222;AreaHeight2=31.194796; %
%CountPointer 
%CountPointerNum
%TimeTable;
%CarNum;
%CarPositionOn;
%CarPositionOff;
%LoadingPosition;
for i=1:length(VarName11)
    if VarName11(i,1)>AreaWidth1&&VarName11(i,1)<AreaWidth2
        if VarName12(i,1)>AreaHeight1&&VarName12(i,1)<AreaHeight2
            Temp(i,1)=CarNum(i,1);
        end
    end
end
CountPointer=unique(Temp);
CountPointer(1,:)=[];
CountPointerNum=length(CountPointer);
CarPositionOn=[]; %'载有人';
CarPositionOff=[]; %'未载人';
SaveNumOn=[];
SaveNumOff=[];
if LoadingPosition(1,1)==0
    CarPositionOn=strcat(num2str(VarName11(1,1)),',',...
            num2str(VarName12(1,1)));
        SaveNumOn=[SaveNumOn,CarNum(i,1)];
else
    CarPositionOff=strcat(num2str(VarName11(1,1)),',',...
            num2str(VarName12(1,1)));
        SaveNumOff=[SaveNumOff,CarNum(i,1)];
end

for i=1:length(CarNum)
    if find(CarNum(i,1)==CountPointer)~=0
        if LoadingPosition(i,1)==0
            CarPositionOn=char(CarPositionOn,strcat(...
                num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1)))));
            SaveNumOn=[SaveNumOn,CarNum(i,1)];
        else
            CarPositionOff=char(CarPositionOff,strcat(...
                num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1)))));
            SaveNumOff=[SaveNumOff,CarNum(i,1)];
        end
    end
end
CarPositionOn=cellstr(CarPositionOn);
CarPositionOff=cellstr(CarPositionOff);
CarPositionOff(1,:)=[];
CarPositionOn(:,2)=num2cell(SaveNumOn(1,:));
CarPositionOff(:,2)=num2cell(SaveNumOff(1,:));
temp=sortrows(CarPositionOn,2);
temp1='';
numOn=[];
for i=1:length(temp)-1
    if temp{i,2}==temp{i+1,2}
        temp1=strcat(temp1,'[',temp{i,1},'],');
    else
        temp1=strcat(temp1,'[',temp{i,1},']');
        numOn=char(numOn,temp1);
        temp1=[];
    end
end
temp=sortrows(CarPositionOff,2);
temp1='';
numOff=[];
for i=1:length(temp)-1
    if temp{i,2}==temp{i+1,2}
        temp1=strcat(temp1,'[',temp{i,1},'],');
    else
        temp1=strcat(temp1,'[',temp{i,1},']');
        numOff=char(numOff,temp1);
        temp1=[];
    end
end
% SaveNumOn=0;
% CarPositionOn=0;
% CarPositionOff=0;
% for i=1:length(CarNum)
%     if find(CarNum(i,1)==CountPointer)~=0
%         if LoadingPosition(i,1)==0
%             if find(CarNum(i,1)==SaveNumOn)==0
%                 SaveNumOn=[SaveNumOn;CarNum(i,1)];
%                 CarPositionOn={CarPositionOn;...
%                     cellstr(strcat(num2str(VarName11(i,1)),','...
%                     ,num2str(num2str(VarName12(i,1)))))};
%             else
%                temp=CarPositionOn(CarNum(i,1)==SaveNumOn,1);
%                CarPositionOn(CarNum(i,1)==SaveNumOn,1)=[temp,...
%                    cellstr(strcat(num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1)))))];
%             end
%         end
%     end
% end
                
% for i=1:length(CarNum)
%     if find(CarNum(i,1)==CountPointer)~=0
%         if LoadingPosition(i,1)==0
%             if find(CarNum(i,1)==SaveNumOn)~=0
%                 SaveNumOn{CarNum(i,1)==SaveNumOn,1}=[...
%                     SaveNumOn{CarNum(i,1)==SaveNumOn,1},strcat(...
%                  num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1))))];
%             else
%                 SaveNumOn=[SaveNumOn;cellstr(strcat(...
%                     num2str(VarName11(i,1)),','...
%                     ,num2str(num2str(VarName12(i,1)))))];
%             end
%         else
%             if find(CarNum(i,1)==SaveNumOn)~=0
%                 SaveNumOff{CarNum(i,1)==SaveNumOff,1}=[...
%                     SaveNumOff{CarNum(i,1)==SaveNumOff,1},strcat(...
%                  num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1))))];
%             else
%                 SaveNumOff=[SaveNumOff;strcat(...
%                     cellstr(num2str(VarName11(i,1)),','...
%                     ,num2str(num2str(VarName12(i,1)))))];
%             end
%         end
%     end
% end
numOn=cellstr(numOn);
numOff=cellstr(numOff);

% xlswrite('numOn.xls',numOn);
% xlswrite('numOff.xls',numOff);
% 
% xlswrite('numOn1.xls',numOn);
% xlswrite('numOff1.xls',numOff);

% figure('Color',[0,1,0],'Position',[100,100,800,500],...
%     'Name','机场出租车数量','NumberTitle','off');
% line('XData',Var(:,1),'YData',Var(:,2),'LineWidth','2');