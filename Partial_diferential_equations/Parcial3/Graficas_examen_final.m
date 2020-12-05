clear all
close all

Limite = 80;
L = 3;
T = 1;



for n=1:Limite
    x = ((pi*n)/3);
    c(n)=12*(sin(n*pi/2)/(n*pi*cosh(x)))^2*(1/cosh(n*pi/3));
end

%c(n)=(1/5)*(1/n*pi)^2*( (100*sin(x)-100*sin((2*pi*n)/5))-(100*sin((3*pi*n)/5)-100*sin(x)) );
x = linspace(0,L,Limite);
t=linspace(0,T,Limite);
m=length(t);
tiempo = length(t);
w=zeros(m,tiempo);

for j=1:tiempo-1;
    for i=1:m-1;
        suma=0;
        for n=1:Limite-1;
            suma = suma +c(n)*sin(((pi*n)/3)*x(i))*cos(((pi*n)/3)*t(j));
        end
        w(i,j)=suma;
    end
end

tiempo_ver=70
figure(1)
plot(x,w(1:m,tiempo_ver))
title(['Onda en t=' num2str(t(tiempo_ver))])
xlabel('x') 
ylim([0 1])
xlim([0 3])
ylabel('u(x,y)') 


figure(2)
mesh(x,t,w)
title('Solución númerica')
xlabel('x') 
ylim([0 1])
xlim([0 3])
ylabel('y') 
zlabel('u(x,y)') 