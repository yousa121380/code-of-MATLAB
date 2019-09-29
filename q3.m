n = 6; %节点数目
C = [0,2,8,0,0,0;
    0,0,5,2,0,0;
    0,0,0,0,3,0;
    0,0,1,0,0,6;
    0,0,0,4,0,7;
    0,0,0,0,0,0;]; %弧容量
b = [0,8,7,0,0,0;
    0,0,5,9,0,0;
    0,0,0,0,9,0;
    0,0,2,0,0,5;
    0,0,0,6,0,10;
    0,0,0,0,0,0;]; %弧上单位流量的费用

wf = 0; %wf表示最大流量
wf0 = Inf; %wf0表示预定的流量值

%流量矩阵f，初始时为零流
for i = 1:n
    for j = 1:n
        f(i,j) = 0;
    end
end 

while(1) %1是判断表达式 1显然永远为真 即是永远循环 如果最大流量达到预定的流量值自动跳出(kreak)循环(while 1 这种形式在不知道循环次数只知道结束循环的条件下使用比较方便)
    for i = 1:n
        for j = 1:n
            if j ~= i 
                a(i,j) = Inf;  %构造赋权有向图
            end
        end
    end
    %定义赋权有向图中弧的权重
    for i = 1:n
        for j = 1:n
            if C(i,j)>0 & f(i,j) == 0
                a(i,j) = b(i,j);
            elseif C(i,j)>0 & f(i,j) == C(i,j)
                a(j,i) = -b(i,j);
            elseif (C(i,j)>0)
			    a(i,j) = b(i,j)
                a(j,i) = -b(i,j);
            end
        end
    end
    %用Ford算法求最短路, 赋初值
    for i = 2:n
        p(i) = Inf;
		s(i) = i;   
    end 
    %求有向赋权图中vs到vt的最短路
    for k = 1:n
        pd = 1; 
        for i = 2:n
            for j = 1:n
                if p(i)>p(j)+a(j,i)
                    p(i) = p(j)+a(j,i);
					s(i) = j;
					pd = 0;
                end
            end
        end
        if(pd) %求最短路的Ford 算法结束
            break;
        end;
    end 
    %不存在vs到vt的最短路, 算法终止. 注意在求最小费%用最大流时构造有向赋权图中不会含负权回路, 所以不会出现k=n
    if p(n) == Inf
        break; 
    end 
	
    %计算调整量
    dvt = Inf; %进入调整过程, dvt表示调整量
    t = n; 
    while(1) 
        if a(s(t),t)>0
            dvtt = C(s(t),t)-f(s(t),t); %前向弧调整量
        elseif a(s(t),t)<0
            dvtt = f(t,s(t)); %后向弧调整量
        end 
        if dvt > dvtt
            dvt = dvtt;
        end
        if s(t) == 1
            break; %当t的标号为vs时, 终止计算调整量
        end 
        t = s(t); %继续调整前一段弧上的流f
    end 
	
    pd = 0;
    if wf+dvt >= wf0 
        dvt = wf0-wf; %如果最大流量大于或等于预定的流量值
	pd = 1;
    end
		
    %调整过程
    t = n;
    while(1) 
        if a(s(t),t)>0 
            f(s(t),t) = f(s(t),t)+dvt; %前向弧调整
        elseif a(s(t),t)<0
            f(t,s(t)) = f(t,s(t))-dvt; %后向弧调整
        end 
        if s(t) == 1 
            break; %当t的标号为vs时, 终止调整过程
        end 
        t = s(t);
    end
		
    if(pd)
        break; %如果最大流量达到预定的流量值
    end
	
    wf = 0;
    for j = 1:n
        wf = wf+f(1,j); %计算最大流量
    end
end 

%计算最小费用
zwf = 0;
for i = 1:n 
    for j = 1:n
        zwf = zwf+b(i,j)*f(i,j);
    end
end
f %显示最小费用最大流
wf %显示最小费用最大流量
zwf %显示最小费用, 程序结束
