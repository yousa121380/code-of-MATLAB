data=strcat(num2str(VarName11(1,1)),',',num2str(VarName12(1,1)));
scatter(VarName11,VarName12);
for i=2:50000
    data=char(data,strcat(num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1)))));
end
a=cellstr(data);
SaveNumOn=0;
CarPositionOn=0;
CarPositionOff=0;
for i=1:length(CarNum)
    if find(CarNum(i,1)==CountPointer)~=0
        if LoadingPosition(i,1)==0
            if find(CarNum(i,1)==SaveNumOn)==0
                SaveNumOn=[SaveNumOn;CarNum(i,1)];
                CarPositionOn={CarPositionOn;...
                    cellstr(strcat(num2str(VarName11(i,1)),','...
                    ,num2str(num2str(VarName12(i,1)))))};
            else
               temp=CarPositionOn(CarNum(i,1)==SaveNumOn,1);
               CarPositionOn(CarNum(i,1)==SaveNumOn,1)=[temp,...
                   cellstr(strcat(num2str(VarName11(i,1)),',',num2str(num2str(VarName12(i,1)))))];
            end
        end
    end
end

%xlswrite('a.xls',a);