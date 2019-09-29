clear all;
%向量（一维数组）
%第一题
x=[0 1 6 5 8 2];y=[1 9 3 7 5 3];
x',x+y,x'+y',3*x,x*y',x'*y,x.*y,x'./y'
pdist2(x,zeros(1,6)),std(x),std(x).^2,dot(x,y),pdist2(x,y)
max(x),min(x),mean(x),sum(x),length(x),sort(x)
find(x>1&x<=5),round(13*(y-4)/17)
%第二题
a=10;b=100;k=7;N=10;
a:k:b,linspace(a,b,N),logspace(a,b,N)
%矩阵（二维数组）1
%第一题
A=[1,5,2;0,3,10;1,2,1];B=[5,8,4;6,9,5;4,7,3;];C=[3,2,5,4;4,1,3,2;9,6,5,3;];
A',3*A,A+B,A-B,A*B,B'*A,A*B*C,A^3
3+A,A/3,A.^3,A.*B,A./B,A/B,A\C
rank(A),trace(A),det(A),[V,D]=eig(A),poly(A),inv(A)
max(max(A)),min(min(A)),mean(mean(A)),ndims(A),sort(A,1),sort(A,2)
C(2,:),C(:,3),C(:,2:4),C(1:2,[3,1,4]),C([3,1],1:2:end),C(:,end:-2:1),C(3),C(5:8),C([4,6,7,1]),C(:),C(:,:)
diag(A),diag(A,2),diag(A,-1),diag(1:5),diag(1:5,-2)
%矩阵（二维数组）2
eye(3,3),zeros(3,3),ones(3,3),diag(A),triu(A),magic(3),rand(3,3)
fliplr(A), flipud(A), rot90(A)
repmat(A,2), reshape(A,1,9)
%第4小题
A=magic(7);
A([1,3,5,7],[2,4,6])=0;
A([2,4,6],[1,3,5,7])=1;
A(1:2:49)=2;
A
%第5小题
A=rand(7);
A1=sum(A,2);
a=find(A1==max(A1));
K=max(a);
a=find(A1==min(A1));
K1=max(a);
if K1~=K
    A([K,K1],:)=A([K1,K],:);
end
A
%线性方程组
A1=[1,2,1;-2,1,-1;1,-4,2;];b1=[2,-1,3]';
inv(A1)*b1
A2=[2,2,-5,1;-1,-3,0,-6;0,2,-1,2;1,4,-7,6;];b2=[8,9,-5,0]';
inv(A2)*b2
A3=[5,6,0,0,0;1,5,6,0,0;0,1,5,6,0;0,0,1,5,6;0,0,0,1,5;];b3=[1,-2,2,-2,4;]';
inv(A3)*b3
%行列式
det([1,0,1;2,1,1;1,3,2;])
det([1,3,3,3;3,2,3,3;3,3,3,3;3,3,3,4])
%微积分
syms x
limit(sin(x)/x,x,0)
limit(1/x,x,0,'right')
limit(1/x,x,0,'left')
limit(exp(-x),x,inf)
limit((1+1/x)^x,x,inf)
diff(sin(x),'x')
diff(x^4,'x')
syms y
diff(sin(x)-cos(y),'x')
diff(sin(x)-cos(y),'y')
diff(x^4,'x',3)
int(sin(x))
int(x^4)
int(sin(x)-cos(y),x,0,1)
syms z
int(x/(1+z^2),z,1,0)
syms k 
symsum(1/k,1,inf)
symsum(((-1)^k)/k,1,inf)
symsum(1/(k*(k+1)),1,inf)
syms t x
taylor(sin(x)+t,x,10,'Order',5)
taylor(sin(x)+t,t,10,'Order',5)
dsolve('Dy=ay','y(0)=b')
dsolve('Dy=ay+sin(t)')
%绘图
x=0:0.1:2*pi;
y1=0.2*exp(-0.5*x).*cos(4*pi*x);
y2=2*exp(-0.5*x).*cos(pi*x);
plot(x,y1,'r',x,y2,'g')
x=-2*pi:pi/10:2*pi;
y=2*sin(x);
subplot(2,2,1);
bar(x,y);
subplot(2,2,2);
stairs(x,y);
subplot(2,2,3);
stem(x,y);
subplot(2,2,4);
fill(x,y,'y');
