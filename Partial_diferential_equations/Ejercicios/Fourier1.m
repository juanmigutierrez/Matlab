Limite = 100;
L = 10;
T = 10;

for n=1:Limite
    c(n)=(1/n*pi)*(-(-1)^2+cos(3*pi*n)/5);
end

x = linspace(3,8,Limite);
t=linspace(0,T,Limite);
m=length(t);
tiempo = length(t);
w=zeros(m,tiempo);

for j=1:tiempo-1;
    for i=1:m-1;
        suma=0;
        for n=1:Limite-1;
            suma = suma +c(n)*sin(n*pi*x(i)/10)*cos(n*pi*t(j)/10);
        end
       w(i,j)=suma;
    end
end


for j=1:tiempo
    plot(w(1:m,j))
    pause(0.05)
end