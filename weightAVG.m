function w=weightAVG(A)
[m,n]=size(A);
SO=sum(A,1);
for j=1:m
    B(:,j)=A(:,j)/SO(j);
end
w=sum(B,2);
w=w/sum(w);