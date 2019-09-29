syms y(x);
eqn1=diff(y,x)==1/(x+y);
dsolve(eqn1)
eqn2=x*diff(y,x)-diff(y,x)^2==y;
dsolve(eqn2)
eqn3=diff(y,x,2)*x-3*diff(y,x)==x^2;
cond=[y(1)==0 y(5)==0];
dsolve(eqn3,cond)