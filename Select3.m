AreaWidth1=121.350708;AreaWidth2=121.357068; %
AreaHeight1=31.190147;AreaHeight2=31.194596; %
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
CarPositionOn=[]; %'ÔØÓÐÈË';
CarPositionOff=[]; %'Î´ÔØÈË';
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
numOn=cellstr(numOn);
numOff=cellstr(numOff);
xlswrite('numOn2.xls',numOn);
xlswrite('numOff2.xls',numOff);