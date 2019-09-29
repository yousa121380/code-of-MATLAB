clear all; clc;close all;
f=-[15 10 12 10 12 11 12 9 9 9 10 20 15 17 13 18 17 9 9 13 7 13 10 13 12];
intcon=1:25;
A=[];
b=[];
Aeq=[ones(1,5),zeros(1,20);
    zeros(1,5),ones(1,5),zeros(1,15);
    zeros(1,10),ones(1,5),zeros(1,10);
    zeros(1,15),ones(1,5),zeros(1,5);
    zeros(1,20),ones(1,5);
    full(sparse(ones(1,5),[1,6,11,16,21],ones(1,5))),zeros(1,4);
    full(sparse(ones(1,5),[2,7,12,17,22],ones(1,5))),zeros(1,3);
    full(sparse(ones(1,5),[3,8,13,18,23],ones(1,5))),zeros(1,2);
    full(sparse(ones(1,5),[4,9,14,19,24],ones(1,5))),zeros(1,1);
    full(sparse(ones(1,5),[5,10,15,20,25],ones(1,5)))];
beq=ones(10,1);
lb=zeros(25,1);
ub=ones(25,1);
[a,z]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
reshape(a,[5,5])
z
