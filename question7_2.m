%Dijkstra Ëã·¨µÄMatlab
T = [0, 9,8, inf, inf, inf, inf;
    inf, 0, 5, 2, 1, inf, inf; 
    inf, inf, 0, 8, inf, 7, inf; 
    inf, inf, inf, 0, 2, 3, inf; 
    inf, inf, inf, inf, 0, inf, 3; 
    inf, inf, inf, inf, 4, 0, 4
    inf, inf, inf, inf, inf, inf,0];
[d Q] = shorta(T)