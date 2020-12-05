clear all;
%Dominio
Lx = 10;
h = 0.1;
nx = ceil(Lx/h)+1;
x=linspace(0,Lx,nx)

%Tiempo
T=10;
k = 0.05;
nt = ceil(T/k)+1;
t =linspace(0,Lx,nt)

%Variables
wn = zeros(nx,nt);
wnm1 = wn; % wn en el tiempo n-1
wnp1 = wn; % wn en el tiempo n+1

alpha = 2

%Parametros
lam = (0.01*k)/h;

%funcion
f = @(x) sin(pi*x);

%Condiciones iniciales
wn(:,1)=f(x);
%w(nx,1)=f(x(nx));

for i=2:nx-1;
    wn(i,1)=f(x(i));
    wn(i,2)=(1-lam^2)*f(i*h)+(lam^2)*(f((i+1)*h)+f((i-1)))/2;
end

    
for i=2:nx-1;
   for j=2:nt-1;
      wn(i,j+1)=2*(1-lam^2)*wn(i,j)+(lam^2)*( wn(i+1,j)+wn(i-1,j) )-wn(i,j-1);
   end
end

set(gcf,'color','w');
surf(t,x,wn);
shading interp;
grid on;