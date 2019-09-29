clear all; clc;close all;
f=-[2,3,4,1,7;
    3,4,2,5,6;
    2,5,3,4,1;
    5,2,3,2,5;
    3,7,6,2,4];
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
f=-[-17.5 -40 250];
A=[];
b=[];
Aeq=[1 1 1];
beq=12;
lb=[0 1 0];
ub=[12 12 2.4];
[a,z]=linprog(f,A,b,Aeq,beq,lb,ub)
