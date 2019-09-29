%脚本文件和函数文件
n=10;
sum=0;
for i=1:n
    sum=sum+factorial(n);
end
i=0;
sum=0;
while i<=n
    sum=sum+factorial(n);
    i=i+1;
end
a=input('input a number!');
i=0;
r=round(rand()*99+1);
while i<7
    if a<r
        disp('low');
    elseif a>r
        disp('high');
    elseif a==r
        disp('you win');
        break;
    end
    a=input('input a number!');
    i=i+1;
end