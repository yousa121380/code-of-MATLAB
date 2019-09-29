% AreaWidth1=121.329515;AreaWidth2=121.359555; %
% AreaHeight1=31.184995;AreaHeight2=31.222801; %
AreaWidth1=121.763102;AreaWidth2=121.892458; %
AreaHeight1=31.112222;AreaHeight2=31.194796; %
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

xlswrite('numOn.xls',CarPositionOn);
xlswrite('numOff.xls',CarPositionOff);