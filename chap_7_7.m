% w = [inf, 4, inf, inf, inf, inf, inf, 1, 2;
% 4, inf, 1, inf, inf, inf, inf, inf, 1;
% inf, 1, inf, 1, inf, inf, inf, inf, 3;
% inf, inf, 1, inf, 5, inf, inf, inf, 4;
% inf, inf, inf, 5, inf, 2, inf, inf, 4;
% inf, inf, inf, inf, 2, inf, 3, inf, 2;
% inf, inf, inf, inf, inf, 3, inf, 5, 5;
% 1, inf, inf, inf, inf, inf, 5, inf, 4;
% 2, 1, 3, 4, 4, 2, 5, 4, inf];
a(1, 1:6) = [0,3, 7, 4, 0, 0];
a(2, 1:6) = [3, 0, 2,0,9,0];
a(3, 1:6) = [7,2,0,1,6,3];
a(4, 1:6) = [4,0,1,0,0,4];
a(5, 1:6) = [0,9,6,0,0,3]; a(6, :)=0;
avoidcircle(a)