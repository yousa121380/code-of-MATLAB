load $PATH
[m,n]=size(TheUnit);
TheTest=zeros(m,3);
for i=1:3
    TheTest(:,i)=TheUnit(:,i);
end
TheUser=max(TheTest(:,1));
TheMovies=max(TheTest(:,2));
TheMatrix=zeros(TheUser,TheMovies);
for i=1:m
    TheMatrix(TheTest(i,1),TheTest(i,2))=TheTest(i,3);
end
TheMatrixSim=zeros(TheMovies,TheMovies);
tic;
for i=1:TheMovies-1
    for j=i+1:TheMovies
        TheMatrixSim(i,j)=Similarity_ab(TheMatrix,i,j);
    end
end
toc;
TheNeibour=10;
TheMatrixSim=TheMatrixSim'+TheMatrixSim;
value_1_index=find(TheMatrixSim>=0.9999);
TheMatrixSim(value_1_index)=0;
load $PATH
[m,n]=size(TheUnit);
TheTest=zeros(m,3);
for i=1:3
    TheTest(:,i)=TheUnit(:,i);
end
TheSoreOfPredict=zeros(m,1);
for j=1:m
    P_u=find(TheMatrix(TheTest(j,1),:)~=0);
    [~,num]=size(P_u);
    TheNeibour=10;
    PuSim=TheMatrixSim(TheTest(j,2),P_u);
    [temp,index]=sort(PuSim,2,'descend');
    [~,num1]=size(index);
    if num1>=TheNeibour
        neibor=(P_u(index(1:TheNeibour)));
    else
        neibor=(P_u(index));
        TheNeibour=num1;
    end
    SumOfScore=sum(TheMatrix(TheTest(j,1),:),2);
    aver_score=SumOfScore/num;
    sum1=0;
    sum2=0;
    for i=1:TheNeibour
        sum1=sum1+TheMatrixSim(TheTest(j,2),neibor(i))*(TheMatrix(TheTest(j,1),neibor(i))-aver_score);
        sum2=sum2+TheMatrixSim(TheTest(j,2),neibor(i));
    end
    if sum2==0
        TheSoreOfPredict(j,1)=round(aver_score);
    else
        TheSoreOfPredict(j,1)=round(aver_score+sum1/sum2);
        if TheSoreOfPredict(j,1)>5
            TheSoreOfPredict(j,1)=5;
        elseif TheSoreOfPredict(j,1)<1
            TheSoreOfPredict(j,1)=1;
        end
    end
end
Ev=zeros(m,3);
Ev(:,1)=TheTest(:,3);
Ev(:,2)=TheSoreOfPredict(:,1);
Ev(:,3)=abs(TheTest(:,3)-TheSoreOfPredict(:,1));
RMSE=sqrt(Ev(:,3)'*Ev(:,3)/m);