t = linspace(0,12*pi,1000);

X1=sin(t).*(exp(cos(t))-2.*cos(4*t)-(sin(t/12).^5));
Y1=cos(t).*(exp(cos(t))-2.*cos(4*t)-(sin(t/12).^5));
Y2 = -Y1;
X1 = [X1 X1];
Y1 = [Y1 Y2];

h=figure;
subplot(1,2,1);
plot(X1,Y1);
xlabel('Real')
ylabel('Imaginario')
subplot(1,2,2);
[X,Y,Z] = sphere(20);
plot3(X,Y,Z,'LineStyle','--','color',[0.5,0.5,0.5]);
xlabel('X')
ylabel('Y')
zlabel('Z')
hold on
[x1,y1,z1]=proyeccion(X1,Y1);
plot3(x1,y1,z1);

function [x,y,z]=proyeccion(x,y) %Proyeccion(X,Y) - Pseudocodigo

Z=complex(x,y); %Creo el vector de numeros imaginarios Z = X+iY
abs1 = abs(Z); %Sacando la norma de cada valor de la matriz

x = 2*real(Z)./(abs1.^2+1); %Sacando x_i
y = 2*imag(Z)./(abs1.^2+1); %Sacando y_i
z = (abs1.^2-1)./(abs1.^2+1); %Sacando z_i
%plot3(x,y,z,'Parent')
end