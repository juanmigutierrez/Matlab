clear all;

m = 50;
N = 100;

%Dominio
L = 40;
h = L/m;
x=0:h:L;

%Tiempo
T=50;
k = T/N;
t =0:k:T;

%Variables
wn = zeros(m+1,N+1);
alpha = 0.5;

%Parametros
lam = (alpha*k)/h;
gamma = 0;

%funcion
%f = @(x) sin(pi*x);

%Condiciones iniciales
wn(1,1)=f(1);
wn(m,1)=f(L);

for i=2:m-1;
    wn(i,1)=f(i*h);
    wn(i,2)=(1-lam^2)*f(i*h)+(0.5)*(lam^2)*(f((i+1)*h)+f((i-1)*h));
end

    
for j=2:N-1;
   for i=2:m-1;
      wn(i,j+1)=2*(1-lam^2)*wn(i,j)+(lam^2)*( wn(i+1,j)+wn(i-1,j) )-wn(i,j-1)-(lam^2*h^2*gamma^2)*wn(i,j);
   end
end

%set(gcf,'color','w');
%surf(t,x,wn);
%shading interp;
%grid on;

for n = 1:length(t)
    plot(x,wn(:,n));
    pause(0.1)
end


function ui = f(x)
    %ui=exp(-(2*(x-1)).^2);
    uL = 3*exp(-(x-2)^2/0.1);
    uR= 0;
    ui = (uR).*(x  < 4)+(uL).*(x >=4);
end

