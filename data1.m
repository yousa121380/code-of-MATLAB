for i=1:200
    x(i)=i*abs(rand(1,1))*abs(sin((1/14)*i))+i;
end
p=polyfit(1:200,x,10);
x1=1:0.1:200;
y1=polyval(p,x1);
plot(x1,y1);