clear all;


%Dominio
L = 40;
dx=0.1;
nx= fix(L/dx);
x=linspace(0,L,nx);

%Tiempo

T=40;
CFL=1;
alpha = 4;
dt = CFL*dx/alpha;
nt = fix(T/dt);
t =linspace(0,T,nt);

%Variables
wn = zeros(nx,nt);


%Parametros
lam = (alpha*dt)/dx;

%funcion
% f = @(x) abs(sin(pi*x));


%Condiciones iniciales

wn(1,1)=f(0);
wn(nx,1)=f(L);

% wn(:,1) = sin(pi*1);
% wn(:,2) = sin(pi.*1);

for i=2:nx-1;
    wn(i,1)=f(i*dx);
    wn(i,2)=(1-CFL^2)*f(i*dx)+(0.5)*(CFL^2)*(f((i+1)*dx)+f((i-1)*dx));
end

    
for j=2:nt-1;
   for i=2:nx-1;
      wn(i,j+1)=2*(1-CFL^2)*wn(i,j)+(CFL^2)*( wn(i+1,j)+wn(i-1,j) )-wn(i,j-1);
   end
end

% figure(1)
% set(gcf,'color','w');
% surf(t,x,wn);
% xlabel('x'), ylabel('t'), zlabel ('u(x,t)'),title('Solución Metodo Númerico');
% shading interp;
% grid on;

figure(2)
for n = 1:length(t)
    axis([-1.5 1.5 -1.5 1.5]);
    plot(x,wn(:,n));
    pause(0.1)
end

% n=20
% set(gcf,'color','w');
% plot(x,wn(:,n));
% valor = t(n)
% xlabel('x'), ylabel('u(x,t)'),title(['Onda en el tiempo t=',num2str(valor)]);

function ui = f(x)
    %ui=exp(-(2*(x-1)).^2);
    uL = 3*exp(-10*(x-2)^2);
    uR= 0;
    ui = (uR).*(x  < 4)+(uL).*(x >=4);
end
