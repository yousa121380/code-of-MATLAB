% A=imread('C:\\Users\\lianxiang\\Desktop\\竞赛试题\\2013竞赛试题\\B\\附件1\\012.bmp');
% [m,n]=size(A);
% all=zeros(m,n*19);
% for k=0:18
%     t=strcat('C:\\Users\\lianxiang\\Desktop\\竞赛试题\\2013竞赛试题\\B\\附件1\\',num2str(k,'%03d'),'.bmp');
%     all(1:m,(n*k+1):n*(k+1))=imread(t);
% end
% imshow(all(1:1000,:))
% B=imread('C:\\Users\\lianxiang\\Desktop\\竞赛试题\\2013竞赛试题\\B\\附件1\\015.bmp');
% an=zeros(1980,72*19);
% an(:,1:72)=A;
% an(:,73:144)=B;
% imwrite(an,'C:\\Users\\lianxiang\\Desktop\\myFile.JPEG');
[X,text]=xlsread('C:\Users\lianxiang\Desktop\下载文件\data.xlsx');
opts = statset('Display','final');
[Idx,C,SumD,D] = kmeans(X,4,'Replicates',3,'Options',opts);

%画出聚类为1的点。X(Idx==1,1),为第一类的样本的第一个坐标；X(Idx==1,2)为第二类的样本的第二个坐标
plot3(X(Idx==1,1),X(Idx==1,2),X(Idx==1,3),'r.','MarkerSize',14)
hold on
plot3(X(Idx==2,1),X(Idx==2,2),X(Idx==2,3),'b.','MarkerSize',14)
hold on
plot3(X(Idx==3,1),X(Idx==3,2),X(Idx==3,3),'g.','MarkerSize',14)
hold on
plot3(X(Idx==4,1),X(Idx==4,2),X(Idx==4,3),'c.','MarkerSize',14)
%绘出聚类中心点,kx表示是圆形
plot3(C(:,1),C(:,2),C(:,3),'kx','MarkerSize',14,'LineWidth',4)
grid on;
text(1,:)=[];
text(:,2:4)=[];
C1=text(Idx==1)
C2=text(Idx==2)
C3=text(Idx==3)
c4=text(Idx==4)
Ctrs
SumD