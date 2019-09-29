% Ford—Fulkerson标号法
M = 1000;%M的取值在(0,+inf)
%u为容量
u(1,2) = 16;u(1,3) = 20;
u(2,4) = 10;
u(3,4) = 6;u(3,5) = 6;
u(4,6) = 10;
u(5,6) = 16;
%f为初始流量
% f(1,2) = 3;f(1,3) = 6;
% f(2,4) = 4;
% f(3,2) = 1;f(3,4) = 2;f(3,5) = 3;
% f(4,5) = 2;f(4,6) = 4;
% f(5,6) = 5;
f=zeros(6,6);
n = length(u); %矩阵u的长度.
list = [];%初始化一个空矩阵,用于存储被标记的点
maxf = zeros(1,n); 
maxf(n) = 1;
while maxf(n)>0
    maxf = zeros(1,n);
    pred = zeros(1,n);
    list = 1;
    record = list;
    maxf(1) = M; %给v1标号
    while (~isempty(list))&(maxf(n) == 0)%如果list不为空而且maxf(n)等于0
        flag = list(1);
        list(1) = [];
        index1 = (find(u(flag,:) ~= 0));%找出u中不为0的元素的下标
			
	%检查v_{flag},并给v_{label1}标号，并未检查v_{label1} (前向弧)
        label1 = index1(find(u(flag,index1)-f(flag,index1) ~= 0));%找到 u(flag,index1)-f(flag,index1)中不为0的元素的位置，此举是为了找出不饱和弧
        label1 = setdiff(label1,record);%删除label1里与record相同的元素，此举可以得到不饱和弧(v(flag),v(label1))中的v(label1)
	list = union(list,label1);%函数union是取并集,
	%给v_{label1}标号(v_{flag},l(v_{label1}))
        pred(label1(find(pred(label1) == 0))) = flag;%v_{flag}
        maxf(label1) = min(maxf(flag),u(flag,label1)-f(flag,label1));%l(v_{label1})取值为maxf(flag),u(flag,label1)-f(flag,label1)最小值
        record = union(record,label1);%record与label1取并集，更新record
		
	%检查v_{label1},并给v_{label2}标号，并未检查v_{label2} (反向弧)
        label2 = find(f(:,flag) ~= 0); %找到f(:,flag)里不为0的元素的位置,此举是为了找出不饱和弧
        label2 = label2';%转置(label2由列向量转变为行向量)
        label2 = setdiff(label2,record);%删除label2里与record相同的元素，此举可以得到不饱和弧(v(flag),v(label1))中的v(label2)
        list = union(list,label2);%list与label1取并集
	%给v_{label2}标号(v_{flag},l(v_{label2}))
        pred(label2(find(pred(label2) == 0))) = -flag;%-v_{flag}
        maxf(label2) = min(maxf(flag),f(label2,flag));%l(v_{label2})取值为min(maxf(flag),f(label2,flag))最小值
        record = union(record,label2);%更新record
    end
    %下面这一段代码是调整过程,调整量theta=maxf(n)也就是l(v_{n})
    if maxf(n)>0
        v2 = n;
        v1 = pred(v2);
        while v2 ~= 1
            if v1>0
                f(v1,v2) = f(v1,v2)+maxf(n);%(v1,v2)是增广链的前向弧(公式7.3.4)
            else
                v1 = abs(v1);
                f(v2,v1) = f(v2,v1)-maxf(n);%(v2,v1)是增广链的后向弧(公式7.3.4)
            end
            v2 = v1;
            v1 = pred(v2);%(v1,v2)不属于增广链
        end
    end
end
f %最后的f为最大流量矩阵
