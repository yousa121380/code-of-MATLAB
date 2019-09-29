[x,y]=meshgrid([-3:.5:3]);
z=x.^2-2*y.^2;
axes('view',[-37.5,30]);
hs=surf(x,y,z,'FaceColor','w','EdgeColor','flat');
grid on;
set(get(gca,'XLabel'),'String','X-axis');
set(get(gca,'YLabel'),'String','Y-axis');
set(get(gca,'ZLabel'),'String','Z-axis');
h1=title('mesh-surf');
set(hs,'FaceColor','interp')
set(h1,'FontName','Times New Roman');