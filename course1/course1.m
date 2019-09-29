nu1=zeros(19,2);
nu2=zeros(19,1);
for k=0:18
    t=strcat('C:\\Users\\lianxiang\\Desktop\\竞赛试题\\2013竞赛试题\\B\\附件1\\',num2str(k,'%03d'),'.bmp');
    A=imread(t);
    ed1=im2bw(A,0.5);
    ed1s=ed1(:,1);
    nu1(k+1,1)=length(find(ed1s<1));
    ed1e=ed1(:,end);
    nu1(k+1,2)=length(find(ed1e<1));
end

% [A,I]=sort(nu1(:,1))
% A=rgb2gray(A);
BW1 = edge(A,'Canny');
%imshow(BW1);
[i,j]=ind2sub(size(A),find(A~=max(A)));
% image(a);
% for m=1:length(i)
%     for n=1:length(j)
%         A(i(m),j(n))=0;
%     end
% end
% ed1=im2bw(A,0.9);
% ed1e=ed1(:,1);
% nu1=length(find(ed1e<1));
% ed2=im2bw(B,0.9);
% ed2e=ed2(:,1);
% nu2=length(find(ed2e<1))
% imshow(ed1);
% BW1=~BW1;
% imshow(BW1)
