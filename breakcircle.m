clear all;
W= [inf, 4, inf, inf, inf, inf, inf, 1, 2;
4, inf, 1, inf, inf, inf, inf, inf, 1;
inf, 1, inf, 1, inf, inf, inf, inf, 3;
inf, inf, 1, inf, 5, inf, inf, inf, 4;
inf, inf, inf, 5, inf, 2, inf, inf, 4;
inf, inf, inf, inf, 2, inf, 3, inf, 2;
inf, inf, inf, inf, inf, 3, inf, 5, 5;
1, inf, inf, inf, inf, inf, 5, inf, 4;
2, 1, 3, 4, 4, 2, 5, 4, inf];
[m, n] = size(W);
e=0;
for i = 1 : n
    for j = i : n
        if W(i, j) ~=0
            e = e + 1;
            E(e, :) = [i, j, W(i, j)];
        end
        if E(e,3)==inf
            E(e,:)=[];
            e=e-1;
        end
    end
end
E,e
count=0;
S = 1 : n;
for i=1:e
    for j=i+1:e
        if E(j,1)==E(i,1)
            in1=E(i,2);
            in2=E(j,2);
            [P,u]=shorta(W(in1:in2,in1:in2));
        end
    end
end
P
