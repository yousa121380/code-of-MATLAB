% Ford��Fulkerson��ŷ�
M = 1000;%M��ȡֵ��(0,+inf)
%uΪ����
u(1,2) = 16;u(1,3) = 20;
u(2,4) = 10;
u(3,4) = 6;u(3,5) = 6;
u(4,6) = 10;
u(5,6) = 16;
%fΪ��ʼ����
% f(1,2) = 3;f(1,3) = 6;
% f(2,4) = 4;
% f(3,2) = 1;f(3,4) = 2;f(3,5) = 3;
% f(4,5) = 2;f(4,6) = 4;
% f(5,6) = 5;
f=zeros(6,6);
n = length(u); %����u�ĳ���.
list = [];%��ʼ��һ���վ���,���ڴ洢����ǵĵ�
maxf = zeros(1,n); 
maxf(n) = 1;
while maxf(n)>0
    maxf = zeros(1,n);
    pred = zeros(1,n);
    list = 1;
    record = list;
    maxf(1) = M; %��v1���
    while (~isempty(list))&(maxf(n) == 0)%���list��Ϊ�ն���maxf(n)����0
        flag = list(1);
        list(1) = [];
        index1 = (find(u(flag,:) ~= 0));%�ҳ�u�в�Ϊ0��Ԫ�ص��±�
			
	%���v_{flag},����v_{label1}��ţ���δ���v_{label1} (ǰ��)
        label1 = index1(find(u(flag,index1)-f(flag,index1) ~= 0));%�ҵ� u(flag,index1)-f(flag,index1)�в�Ϊ0��Ԫ�ص�λ�ã��˾���Ϊ���ҳ������ͻ�
        label1 = setdiff(label1,record);%ɾ��label1����record��ͬ��Ԫ�أ��˾ٿ��Եõ������ͻ�(v(flag),v(label1))�е�v(label1)
	list = union(list,label1);%����union��ȡ����,
	%��v_{label1}���(v_{flag},l(v_{label1}))
        pred(label1(find(pred(label1) == 0))) = flag;%v_{flag}
        maxf(label1) = min(maxf(flag),u(flag,label1)-f(flag,label1));%l(v_{label1})ȡֵΪmaxf(flag),u(flag,label1)-f(flag,label1)��Сֵ
        record = union(record,label1);%record��label1ȡ����������record
		
	%���v_{label1},����v_{label2}��ţ���δ���v_{label2} (����)
        label2 = find(f(:,flag) ~= 0); %�ҵ�f(:,flag)�ﲻΪ0��Ԫ�ص�λ��,�˾���Ϊ���ҳ������ͻ�
        label2 = label2';%ת��(label2��������ת��Ϊ������)
        label2 = setdiff(label2,record);%ɾ��label2����record��ͬ��Ԫ�أ��˾ٿ��Եõ������ͻ�(v(flag),v(label1))�е�v(label2)
        list = union(list,label2);%list��label1ȡ����
	%��v_{label2}���(v_{flag},l(v_{label2}))
        pred(label2(find(pred(label2) == 0))) = -flag;%-v_{flag}
        maxf(label2) = min(maxf(flag),f(label2,flag));%l(v_{label2})ȡֵΪmin(maxf(flag),f(label2,flag))��Сֵ
        record = union(record,label2);%����record
    end
    %������һ�δ����ǵ�������,������theta=maxf(n)Ҳ����l(v_{n})
    if maxf(n)>0
        v2 = n;
        v1 = pred(v2);
        while v2 ~= 1
            if v1>0
                f(v1,v2) = f(v1,v2)+maxf(n);%(v1,v2)����������ǰ��(��ʽ7.3.4)
            else
                v1 = abs(v1);
                f(v2,v1) = f(v2,v1)-maxf(n);%(v2,v1)���������ĺ���(��ʽ7.3.4)
            end
            v2 = v1;
            v1 = pred(v2);%(v1,v2)������������
        end
    end
end
f %����fΪ�����������
