n = 6; %�ڵ���Ŀ
C = [0,2,8,0,0,0;
    0,0,5,2,0,0;
    0,0,0,0,3,0;
    0,0,1,0,0,6;
    0,0,0,4,0,7;
    0,0,0,0,0,0;]; %������
b = [0,8,7,0,0,0;
    0,0,5,9,0,0;
    0,0,0,0,9,0;
    0,0,2,0,0,5;
    0,0,0,6,0,10;
    0,0,0,0,0,0;]; %���ϵ�λ�����ķ���

wf = 0; %wf��ʾ�������
wf0 = Inf; %wf0��ʾԤ��������ֵ

%��������f����ʼʱΪ����
for i = 1:n
    for j = 1:n
        f(i,j) = 0;
    end
end 

while(1) %1���жϱ��ʽ 1��Ȼ��ԶΪ�� ������Զѭ�� �����������ﵽԤ��������ֵ�Զ�����(kreak)ѭ��(while 1 ������ʽ�ڲ�֪��ѭ������ֻ֪������ѭ����������ʹ�ñȽϷ���)
    for i = 1:n
        for j = 1:n
            if j ~= i 
                a(i,j) = Inf;  %���츳Ȩ����ͼ
            end
        end
    end
    %���帳Ȩ����ͼ�л���Ȩ��
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
    %��Ford�㷨�����·, ����ֵ
    for i = 2:n
        p(i) = Inf;
		s(i) = i;   
    end 
    %������Ȩͼ��vs��vt�����·
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
        if(pd) %�����·��Ford �㷨����
            break;
        end;
    end 
    %������vs��vt�����·, �㷨��ֹ. ע��������С��%�������ʱ��������Ȩͼ�в��Ậ��Ȩ��·, ���Բ������k=n
    if p(n) == Inf
        break; 
    end 
	
    %���������
    dvt = Inf; %�����������, dvt��ʾ������
    t = n; 
    while(1) 
        if a(s(t),t)>0
            dvtt = C(s(t),t)-f(s(t),t); %ǰ�򻡵�����
        elseif a(s(t),t)<0
            dvtt = f(t,s(t)); %���򻡵�����
        end 
        if dvt > dvtt
            dvt = dvtt;
        end
        if s(t) == 1
            break; %��t�ı��Ϊvsʱ, ��ֹ���������
        end 
        t = s(t); %��������ǰһ�λ��ϵ���f
    end 
	
    pd = 0;
    if wf+dvt >= wf0 
        dvt = wf0-wf; %�������������ڻ����Ԥ��������ֵ
	pd = 1;
    end
		
    %��������
    t = n;
    while(1) 
        if a(s(t),t)>0 
            f(s(t),t) = f(s(t),t)+dvt; %ǰ�򻡵���
        elseif a(s(t),t)<0
            f(t,s(t)) = f(t,s(t))-dvt; %���򻡵���
        end 
        if s(t) == 1 
            break; %��t�ı��Ϊvsʱ, ��ֹ��������
        end 
        t = s(t);
    end
		
    if(pd)
        break; %�����������ﵽԤ��������ֵ
    end
	
    wf = 0;
    for j = 1:n
        wf = wf+f(1,j); %�����������
    end
end 

%������С����
zwf = 0;
for i = 1:n 
    for j = 1:n
        zwf = zwf+b(i,j)*f(i,j);
    end
end
f %��ʾ��С���������
wf %��ʾ��С�����������
zwf %��ʾ��С����, �������
