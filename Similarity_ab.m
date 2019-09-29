function Sim=Similarity_ab(TheScoreMatrix,a,b)
temp=TheScoreMatrix(:,a)&TheScoreMatrix(:,b);
PAB=find(temp);
PAB=PAB';
if isempty(PAB)
    Sim=0;
else
    [~,temp]=size(PAB);
    sum1=0;
    sum2=0;
    sum3=0;
    for i=1:temp
        [~,m]=size(find(TheScoreMatrix(PAB(i),:)~=0));
        sum_score=sum(TheScoreMatrix(PAB(i),:),2);
        aver_score=sum_score/m;
        sum1=sum1+(TheScoreMatrix(PAB(i),a)-aver_score)*(TheScoreMatrix(PAB(i),b)-aver_score);
        sum2=sum2+(TheScoreMatrix(PAB(i),a)-aver_score)^2;
        sum3=sum3+(TheScoreMatrix(PAB(i),b)-aver_score)^2;
    end
    if sum2==0||sum3==0
        Sim=0;
    else
        Sim=sum1/sqrt(sum2*sum3);
    end
end