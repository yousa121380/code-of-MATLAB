function [d,Q] = shorta(T)
pp(1:length(T)) = 0; pp(1) = 1; Q = 1;
n=length(T);
M = max(T(:)); d(1:length(T)) = M; d(1) = 0; K = 1;P=zeros(n,n);p=zeros(n,n);count=1;
while sum(pp)<length(T)
    tt = find(pp==0); % 找出未标记的点
    [d(tt),I]= min([d(tt);d(K)+T(K,tt)]);
    p(count,tt)=I-1;
    ttt = find(d(tt)==min(d(tt)));
    K = tt(ttt(1)); pp(K) = 1; Q = [Q, K];
    count=count+1;
end
s=zeros(n,n);
s(1,1)=1;
for i=2:n
    l=i;
    count=1;
    s(i,count)=i;
    while l~=1
        a=find(p(:,l)~=0);
        l=Q(max(a));
        s(i,count+1)=l;
        count=count+1;
    end
end
