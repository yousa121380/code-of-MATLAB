M=[1,1,2,2,1/2;
    1,1,2,2,1/3;
    1/2,1/2,1,1,1/2;
    1/2,1/2,1,1,1/2;
    2,3,2,2,1;];
w=weightAVG(M);
[X1,text1]=xlsread('C:\Users\lianxiang\Desktop\工作簿2.xlsx');
[X2,text2]=xlsread('C:\Users\lianxiang\Desktop\评判数据.xlsx');
[X3,text3]=xlsread('C:\Users\lianxiang\Desktop\工作簿1.xlsx');
X1(:,1)=[];
X2(:,1)=[];
X11=X1(:,1:5);
X12=X1(:,6:10);
X21=X2(:,1:5);
X22=X2(:,6:10);
X31=X2(:,1:5);
X32=X2(:,6:10);
XX1=((X11+X21+X31)/3)*w;
XX2=((X12+X22+X32)/3)*w;
opts = statset('Display','final');
[idx,C,sumd,d]= kmeans(XX1,3,'Replicates',16,'Options',opts);
idx
[idx,C,sumd,d]= kmeans(XX2,3,'Replicates',16,'Options',opts);
idx