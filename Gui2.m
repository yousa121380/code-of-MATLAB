k=1.5;
x=[0 1 1 0;
    1 1 1 1;
    1 0 0 1;
    0 0 0 0;
    1 0 0 1;
    0 1 1 0]';
y=k*[0 0 0 0;
     0 1 1 0;
     1 1 1 1;
     1 0 0 1;
     0 0 1 1;
     0 0 1 1]';
z=[0 0 1 1;
    0 0 1 1;
    0 0 1 1;
    0 0 1 1;
    0 0 0 0;
    1 1 1 1]';
tcolor=rand(size(x,1),size(x,2));
patch(x,y,z,tcolor,'FaceColor','flat');
view(-37.5,35);
h2=gca;
set(h2,'Box','on');