[x y]=hipocicloide(8,1);
%[x1 y1]=hipocicloide(6,2);
%[x2 y2]=hipocicloide(6,4);
proyeccion(x,y);


function c=proyeccion(x,y)
figure,
[x, y, z] = sphere(20);
axis equal
surf(x, y, z,'FaceColor',[0 0 1], 'FaceAlpha',0.2);

title("Esfera de Riemman")
colormap hot

end


function [x y]=hipocicloide(r1,r2)
    
alpha= linspace(0,2*pi,100);
alpha1=linspace(pi*(1/4),(9*pi)/4,100);
x1=((r1-r2)*cos(alpha1))+(r2*cos(alpha1.*(1-(r1/r2))));
y1=((r1-r2)*sin(alpha1))+(r2*sin(alpha1.*(1-(r1/r2))));

x2=(((r1/2)-(r2/2))*cos(alpha))+(r2*cos(alpha.*(1-((r1/2)/(r2/2)))));
y2=(((r1/2)-(r2/2))*sin(alpha))+(r2*sin(alpha.*(1-((r1/2)/(r2/2)))));
figure,
plot(x1,y1);
xlabel("Real");
ylabel("Imaginario");
hold on;
plot(x2,y2);

r2=-r2;
alpha= linspace(0,4*pi,100);
alpha1=linspace(pi*(1/4),(9*pi)/4,100);
x3=((r1-r2)*cos(alpha1))+(r2*cos(alpha1.*(1-(r1/r2))));
y3=((r1-r2)*sin(alpha1))+(r2*sin(alpha1.*(1-(r1/r2))));

x4=(((r1/2)-(r2/2))*cos(alpha))+(r2*cos(alpha.*(1-((r1/2)/(r2/2)))));
y4=(((r1/2)-(r2/2))*sin(alpha))+(r2*sin(alpha.*(1-((r1/2)/(r2/2)))));
plot(x3,y3);
plot(x4,y4);

x=[x1 x2 x3 x4];
y=[y1 y2 y3 y4];
end