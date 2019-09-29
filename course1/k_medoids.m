%X=[];
opts = statset('Display','iter'); %��ʾ����ϸ��
[idx,C,sumd,d,midx,info] = kmedoids(X,2,'Distance','cityblock','Options',opts);
%idx�����ݶ�Ӧ�Ľ��
%C�Ǿ������ĵ�λ��
%sumd�Ǹ������е����Ӧ�ľ������ĵľ���֮��
%d�Ǹ������е���������ĵ����о���
%midx�Ǿ��������Ŀ
%info
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',7)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',7)
plot(C(:,1),C(:,2),'co','MarkerSize',7,'LineWidth',1.5)
legend('Cluster 1','Cluster 2','Medoids','Location','NW');
title('Cluster Assignments and Medoids');
hold off