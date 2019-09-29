%Dijkstra 算法的Matlab
T = [0, 20, 15, inf, inf, inf, inf; inf, 0, inf, 8, 24, inf, inf; ...
inf, inf, 0, 10, inf, 6, inf; inf, inf, inf, 0, 10, 8, inf; ...
inf, inf, inf, inf, 0, inf, 11; inf, inf, inf, inf, inf, 0, 20];
pp(1:length(T)) = 0; pp(1) = 1; Q = 1;
M = max(T(:)); d(1:length(T)) = M; d(1) = 0; K = 1;
while sum(pp)<length(T) %依次遍历每个未标号的点
    tt = find(pp==0); % 找出未标记的点
    d(tt) = min(d(tt), d(K)+T(K,tt)); %对于此次遍历的点所能到达的点的累计距离与现有的最短路径作比较
    ttt = find(d(tt)==min(d(tt)));%找出此次遍历的点到未标号的点的最短距离
    K = tt(ttt(1)); pp(K) = 1; Q = [Q, K]; %标号最短路径，将到达此次遍历的点最短距离依次添加到Q里
end
% [d Q] = shorta(T)