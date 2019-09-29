X=xlsread('C:\Users\lianxiang\Desktop\2019年安徽大学数学建模竞赛题目\2019年安徽大学数学建模竞赛B题\附件1.xls');
xi=X(:,2);
yi=X(:,3);
zi=X(:,4);
theta=X(:,5)*pi/180;
X1=10;Y1=-45;Z1=106; %钻头位置坐标
RA=96;%A轴距离平板的距离
L=10;%钻头距离平板的距离
Xi=X1-xi;
Yi=Y1-sin(theta)*RA-cos(theta).*yi;
Zi=Z1-cos(theta)*RA+sin(theta).*yi-L;
plot3(Xi,Yi,Zi)
axis('equal');
grid on;
filename = 'C:\Users\lianxiang\Desktop\2019年安徽大学数学建模竞赛题目\2019年安徽大学数学建模竞赛B题\附件1.xls';
% A = {'Time','Temperature'; 12,98; 13,99; 14,97};
sheet = 1;
xlRange = 'F2';
xlswrite(filename,X(:,5),sheet,xlRange)
xlRange = 'G2';
xlswrite(filename,zeros(55,1),sheet,xlRange)
xlRange = 'H2';
xlswrite(filename,Xi,sheet,xlRange)
xlRange = 'I2';
xlswrite(filename,Yi,sheet,xlRange)
xlRange = 'J2';
xlswrite(filename,Zi,sheet,xlRange)