syms x y z;
eqn1=(10-x)*sqrt(3)/2-(-45-y)*sin(20*pi/180)+x==-34;
eqn2=(10-x)*sin(20*pi/180)/2+(-45-y)*cos(20*pi/180)*sqrt(3)/2-(96-z)/2+y==-123;
eqn3=(10-x)*sin(20*pi/180)/2+(-45-y)*cos(20*pi/180)/2+(96-z)*sqrt(3)/2+z==42;
[x,y,z]= solve(eqn1,eqn2,eqn3,'x','y','z');
eval(x)
eval(y)
eval(z)