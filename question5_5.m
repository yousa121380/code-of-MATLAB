fun = @(x)50*x(1)+0.2*x(1)^2+50*x(2)+0.2*x(2)^2+...
50*x(3)+0.2*x(3)^2+(x(1)-40)*4+(x(1)+x(2)-100)*4;
x0=[1,1,1];
A=[-1 0 0
    1 0 0
    -1 -1 0];
b=[-40
    100
    -100];
Aeq=[1,1,1];
beq=[180];
ub=[0 0 0];
lb=[100 100 100];
[x,fval]=fmincon(fun,x0,A,b,Aeq,beq,ub,lb)
fun =@(x)-x(1);
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0,0];
ub = [inf,inf];
nonlcon = @answer61;
x0 = [0,0];
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
fun=@(x)(x(1)-3)^2+(x(2)-3)^2;
x0=[0,0];
A=[1,1];
b=4;
Aeq=[];
beq=[];
ub=[0,0];
lb=[inf,inf];
[x,fval]=fmincon(fun,x0,A,b,Aeq,beq,ub,lb)
f=-[15,18,21,24;
    19,23,22,18;
    26,18,16,19;
    19,21,23,17;];
intcon=1:16;
A=[];
b=[];
Aeq=[ones(1,4),zeros(1,12);
    zeros(1,4),ones(1,4),zeros(1,8);
    zeros(1,8),ones(1,4),zeros(1,4);
    zeros(1,12),ones(1,4),
    full(sparse(ones(1,4),[1,5,9,13],ones(1,4))),zeros(1,3);
    full(sparse(ones(1,4),[2,6,10,14],ones(1,4))),zeros(1,2);
    full(sparse(ones(1,4),[3,7,11,15],ones(1,4))),zeros(1,1);
    full(sparse(ones(1,4),[4,8,12,16],ones(1,4)));];
beq=ones(8,1);
lb=zeros(16,1);
ub=ones(16,1);
[a,z]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
reshape(a,[4,4])
z


