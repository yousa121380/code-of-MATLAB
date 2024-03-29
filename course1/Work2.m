X=xlsread('C:\Users\lianxiang\Desktop\2019年安徽大学数学建模竞赛题目\2019年安徽大学数学建模竞赛B题\附件2.xls');
xi=X(:,2);
yi=X(:,3);
zi=X(:,4);
theta=X(:,5)*pi/180;
thi=X(:,6)*pi/180;
X1=10;Y1=-45;Z1=106; %钻头位置坐标
RA=96;%A轴距离平板的距离
RB=46;%B轴距离平板的距离
L=10;%钻头距离平板的距离
Xi=X1-(sin(thi).*RB+cos(thi).*xi);
RA1=RB.*cos(thi)+RA-RB-xi.*sin(thi);
Yi=Y1-sin(theta).*RA1-cos(theta).*yi;
Zi=Z1-cos(theta).*RA1+sin(theta).*yi-L;
plot3(Xi,Yi,Zi)
axis('equal');
xlabel('x');ylabel('y');zlabel('z')
grid on;
filename = 'C:\Users\lianxiang\Desktop\2019年安徽大学数学建模竞赛题目\2019年安徽大学数学建模竞赛B题\附件2.xls';
sheet = 1;
xlRange = 'G2';
xlswrite(filename,X(:,5),sheet,xlRange)
xlRange = 'H2';
xlswrite(filename,X(:,6),sheet,xlRange)
xlRange = 'I2';
xlswrite(filename,Xi,sheet,xlRange)
xlRange = 'J2';
xlswrite(filename,Yi,sheet,xlRange)
xlRange = 'K2';
xlswrite(filename,Zi,sheet,xlRange)