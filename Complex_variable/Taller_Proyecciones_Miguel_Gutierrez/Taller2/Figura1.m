a = 1; %Fijo constante
phi = 30; %Fijo angulo
t = 1:100; %Creo vector de variable t
t2 = 100:200;%Creo vector de variable t2

X1= a*(2*cos(t)-cos(2*t))-1.5; % Genero X1
Y1 = a*(2*sin(t)-sin(2*t))-1.5; % Genero Y1
Y2 = -Y1; %Genero el inverso de Y1, esto era idealmente para graficar la parte de abajo de los y's
X2 = a*(2*cos(t2+pi)-cos(2*t2+pi))+1; %Genero X2 con diferentes parametros phi y 1
Y3 = a*(2*sin(-t2)-sin(2*-t2))+1;%Genero X2 con diferentes parametros 1
Y4 = -Y3-1;
X1 = [X1 X1 X2 X2];
Y1= [Y1 Y2 Y3 Y4];


h=figure; % Creo el subplot
subplot(1,2,1);
plot(X1,Y1);
xlabel('Real')
ylabel('Imaginario')
subplot(1,2,2);
[X,Y,Z] = sphere(20);
plot3(X,Y,Z,'LineStyle','--','color',[0.5,0.5,0.5]);
hold on
xlabel('X')
ylabel('Y')
zlabel('Z')
[x1,y1,z1]=proyeccion(X1,Y1);%Genero la proyección
plot3(x1,y1,z1);

function [x,y,z]=proyeccion(x,y) %Proyeccion(X,Y) - Pseudocodigo

Z=complex(x,y); %Creo el vector de numeros imaginarios Z = X+iY
abs1 = abs(Z); %Sacando la norma de cada valor de la matriz

x = 2*real(Z)./(abs1.^2+1); %Sacando x_i
y = 2*imag(Z)./(abs1.^2+1); %Sacando y_i
z = (abs1.^2-1)./(abs1.^2+1); %Sacando z_i
%plot3(x,y,z,'Parent')
end

