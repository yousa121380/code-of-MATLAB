X=xlsread('C:\Users\lianxiang\Desktop\2019�갲�մ�ѧ��ѧ��ģ������Ŀ\2019�갲�մ�ѧ��ѧ��ģ����B��\����2.xls');
xi=X(:,2);
yi=X(:,3);
zi=X(:,4);
theta=X(:,5)*pi/180;
thi=X(:,6)*pi/180;
X1=10;Y1=-45;Z1=106; %��ͷλ������
RA=96;%A�����ƽ��ľ���
RB=46;%B�����ƽ��ľ���
L=10;%��ͷ����ƽ��ľ���
Xi=X1-(sin(thi).*RB+cos(thi).*xi);
RA1=RB.*cos(thi)+RA-RB-xi.*sin(thi);
Yi=Y1-sin(theta).*RA1-cos(theta).*yi;
Zi=Z1-cos(theta).*RA1+sin(theta).*yi-L;
plot3(Xi,Yi,Zi)
axis('equal');
xlabel('x');ylabel('y');zlabel('z')
grid on;
filename = 'C:\Users\lianxiang\Desktop\2019�갲�մ�ѧ��ѧ��ģ������Ŀ\2019�갲�մ�ѧ��ѧ��ģ����B��\����2.xls';
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