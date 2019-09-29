%X=[];
opts = statset('Display','iter'); %显示聚类细节
[idx,C,sumd,d,midx,info] = kmedoids(X,2,'Distance','cityblock','Options',opts);
%idx是数据对应的结点
%C是聚类中心的位置
%sumd是该类所有点与对应的聚类中心的距离之和
%d是该类所有点与聚类中心的所有距离
%midx是聚类分类数目
%info
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',7)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',7)
plot(C(:,1),C(:,2),'co','MarkerSize',7,'LineWidth',1.5)
legend('Cluster 1','Cluster 2','Medoids','Location','NW');
title('Cluster Assignments and Medoids');
hold off