x = [];
cx = -0.2; %Creo los puntos centrados
cy = 0.5; %Creo los puntos centrados
r = 1; %Genero el radio del corazon
x = linspace(cx-r,cx+r,20); %Genero las variables x
y = sqrt(r.^2-(x-cx).^2);
ym = -y;

X = [x NaN x]; %Creando eje x circulo
Y = [y NaN ym]; %Creando eje y Circulo

seg = 1:100;

t1=linspace(0,2*pi,100); %creando angulos
Y2=[];
X2=[];

size(X)


for e=1:1:20
        c1 = X(e);
        c2 = Y(e);
        x2 = gra_centrox(c1,c2,t1);
        y2 = gra_centroy(c1,c2,t1);
        X2 = [X2 x2  NaN];
        Y2 = [Y2 y2  NaN];
end

h=figure
subplot(1,2,1)
plot(X2,Y2)
xlabel('Real')
ylabel('Imaginario')
subplot(1,2,2)
[X,Y,Z] = sphere(20);
[x1,y1,z1]=proyeccion(X2,Y2);
plot3(x1,y1,z1);
xlabel('X')
ylabel('Y')
zlabel('Z')
hold on
plot3(X,Y,Z,'LineStyle','--','color',[0.5,0.5,0.5]);


function [x,y,z]=proyeccion(x,y) %Proyeccion(X,Y) - Pseudocodigo

Z=complex(x,y); %Creo el vector de numeros imaginarios Z = X+iY
abs1 = abs(Z); %Sacando la norma de cada valor de la matriz

x = 2*real(Z)./(abs1.^2+1); %Sacando x_i
y = 2*imag(Z)./(abs1.^2+1); %Sacando y_i
z = (abs1.^2-1)./(abs1.^2+1); %Sacando z_i
%plot3(x,y,z,'Parent')
end

function x2=gra_centrox(cx,cy,t1)
    x2 = cx+0.1*(15*sin(t1).^3); %centro cx
    %y2 = cy+13*cos(t1)-5*cos(2*t1)-2*cos(3*t1)-cos(4*t1) %centro cy
    return
end

function y2=gra_centroy(cx,cy,t1)
    %x2 = cx+15*sin(t1).^3 %centro cx
    y2 = cy+0.1*(13*cos(t1)-5*cos(2*t1)-2*cos(3*t1)-cos(4*t1)); %centro cy
    return
end

function [X,Y,Z]=esfera1()
 [X,Y,Z] = sphere(20);
 plot3(X,Y,Z,'LineStyle','--','color',[0.5,0.5,0.5],'Parent', object);
 hold on
return
end