%Dijkstra �㷨��Matlab
T = [0, 20, 15, inf, inf, inf, inf; inf, 0, inf, 8, 24, inf, inf; ...
inf, inf, 0, 10, inf, 6, inf; inf, inf, inf, 0, 10, 8, inf; ...
inf, inf, inf, inf, 0, inf, 11; inf, inf, inf, inf, inf, 0, 20];
pp(1:length(T)) = 0; pp(1) = 1; Q = 1;
M = max(T(:)); d(1:length(T)) = M; d(1) = 0; K = 1;
while sum(pp)<length(T) %���α���ÿ��δ��ŵĵ�
    tt = find(pp==0); % �ҳ�δ��ǵĵ�
    d(tt) = min(d(tt), d(K)+T(K,tt)); %���ڴ˴α����ĵ����ܵ���ĵ���ۼƾ��������е����·�����Ƚ�
    ttt = find(d(tt)==min(d(tt)));%�ҳ��˴α����ĵ㵽δ��ŵĵ����̾���
    K = tt(ttt(1)); pp(K) = 1; Q = [Q, K]; %������·����������˴α����ĵ���̾���������ӵ�Q��
end
% [d Q] = shorta(T)