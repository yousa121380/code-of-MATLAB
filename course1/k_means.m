[X,text]=xlsread('C:\Users\lianxiang\Desktop\��Ϣ����.xlsx');
opts = statset('Display','final');
[m,n]=size(X);
for i=1:n
    [idx,C,sumd,d]= kmeans(X(:,i),4,'Replicates',6,'Options',opts);
    C
    sumd
end
%idx�����ݶ�Ӧ�Ľ��
%C�Ǿ������ĵ�λ��
%sumd�Ǹ������е����Ӧ�ľ������ĵľ���֮��
%d�Ǹ������е���������ĵ����о���
%midx�Ǿ��������Ŀ
%info
%��������Ϊ1�ĵ㡣X(Idx==1,1),Ϊ��һ��������ĵ�һ�����ꣻX(Idx==1,2)Ϊ�ڶ���������ĵڶ�������
% plot3(X(I==1,1),X(I==1,2),'r.','MarkerSize',14)
% hold on
% plot3(X(I==2,1),X(I==2,2),'b.','MarkerSize',14)
% hold on
% plot3(X(I==3,1),X(I==3,2),'g.','MarkerSize',14)
% hold on
% plot3(X(I==4,1),X(I==4,2),'c.','MarkerSize',14)
%����������ĵ�,kx��ʾ��Բ��
% plot3(C(:,1),C(:,2),'kx','MarkerSize',14,'LineWidth',4)
% grid on;