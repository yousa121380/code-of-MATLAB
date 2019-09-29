[X,text]=xlsread('C:\Users\lianxiang\Desktop\信息汇总.xlsx');
opts = statset('Display','final');
[m,n]=size(X);
for i=1:n
    [idx,C,sumd,d]= kmeans(X(:,i),4,'Replicates',6,'Options',opts);
    C
    sumd
end
%idx是数据对应的结点
%C是聚类中心的位置
%sumd是该类所有点与对应的聚类中心的距离之和
%d是该类所有点与聚类中心的所有距离
%midx是聚类分类数目
%info
%画出聚类为1的点。X(Idx==1,1),为第一类的样本的第一个坐标；X(Idx==1,2)为第二类的样本的第二个坐标
% plot3(X(I==1,1),X(I==1,2),'r.','MarkerSize',14)
% hold on
% plot3(X(I==2,1),X(I==2,2),'b.','MarkerSize',14)
% hold on
% plot3(X(I==3,1),X(I==3,2),'g.','MarkerSize',14)
% hold on
% plot3(X(I==4,1),X(I==4,2),'c.','MarkerSize',14)
%绘出聚类中心点,kx表示是圆形
% plot3(C(:,1),C(:,2),'kx','MarkerSize',14,'LineWidth',4)
% grid on;