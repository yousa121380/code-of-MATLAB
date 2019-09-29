function [circle,sum]=circle1(a)
  a = a+a';
  c1 = [5 1:4 6];
  L = length(c1);
  flag = 1;
  while flag>0
    flag = 0;
    for m=1:L-3
      for n=m+2:L-1
        if a(c1(m),c1(n))+a(c1(m+1),c1(n+1))< a(c1(m),c1(m+1))+a(c1(n),c1(n+1))
          flag = 1;
          c1(m+1:n) = c1(n:-1:m+1);
        end; 
      end; 
    end; 
  end
  sum1 = 0;
  for i=1:L-1
    sum1 = sum1+a(c1(i),c1(i+1));
  end
  circle = c1;
  sum = sum1;
  c1 = [5 6 1:4]; % 改变初始圈，最后一个顶点不动
  sum1 = 0; flag = 1;
  while flag>0
    flag=0;
    for m=1:L-3
      for n=m+2:L-1
        if a(c1(m),c1(n))+a(c1(m+1),c1(n+1)) < ...
          a(c1(m),c1(m+1))+a(c1(n),c1(n+1))
          flag=1; c1(m+1:n)=c1(n:-1:m+1);
        end; 
      end; 
    end; 
  end
  sum1 = 0;
  for i=1:L-1
    sum1 = sum1+a(c1(i),c1(i+1));
  end
  if sum1<sum
    sum = sum1;
    circle = c1;
  end