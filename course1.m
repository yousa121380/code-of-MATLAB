a=10;b=12;c=14;
a1=3;b1=4;c1=5;
a2=2;b2=3;c2=5;
ALL=perms(1:6);
area=[a*b,a*b,a*c,a*c,b*c,b*c]     %����Ҫ�е�������
areas=area;                           %��ǰ�������
count=zeros(1,6);                    %���м���
s=0;                                 %��ǰ���е����
as=zeros(1,6);                         %�е����
all=zeros(1,720);                     %�����е����
for i=1:length(ALL)
    areas=area;
    for j=1:6
        m=ALL(i,j);                  %��ǰ���е����
        s=areas(m);
        switch m
            case 1
                areas=areas-[0,0,(a1*count(4)+a2+(a-a1-a2)*count(3))*c1,(a1*count(4)+a2+(a-a1-a2)*count(3))*c1,b*c1,b*c1];
            case 2
                areas=areas-[0,0,(a1*count(4)+a2+(a-a1-a2)*count(3))*(c-c1-c2),(a1*count(4)+a2+(a-a1-a2)*count(3))*(c-c1-c2),b*(c-c1-c2),b*(c-c1-c2)];
            case 3
                areas=areas-[(a1*count(4)+a2+(a-a1-a2)*count(3))*b1,(a1*count(4)+a2+(a-a1-a2)*count(3))*b1,0,0,b1*c,b1*c];
            case 4
                areas=areas-[(a1*count(4)+a2+(a-a1-a2)*count(3))*(b-b1-b2),(a1*count(4)+a2+(a-a1-a2)*count(3))*(b-b1-b2),0,0,(b-b1-b2)*c,(b-b1-b2)*c];
            case 5
                areas=areas-[a1*b,a1*b,a1*c,a1*c,0,0];
            case 6
                areas=areas-[(a-a1-a2)*b,(a-a1-a2)*b,(a-a1-a2)*c,(a-a1-a2)*c,0,0];
        end
        as(j)=s;
    end
    all2(i,:)=as;
    all(i)=sum(as);
end
s=find(all==min(all))
l=['ǰ','��','��','��','��','��'];
all2(s,:)
l(ALL(s,:));