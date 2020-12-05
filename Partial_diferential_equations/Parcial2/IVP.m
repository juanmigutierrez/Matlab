clear;


xend = 10; %tamaño eje x
tend = 3; %tamaño eje y
N = 100; % Numero de puntos grilla
dx = xend/N;
dt= 0.01;

x = 0:dx:xend;
nt = floor(tend/dt);
nx = floor(xend/dx)
dt = tend/ nt; %k

alpha = 2
lambda = (alpha*dt)/dx

u0 = uinit(x);
u1 = uinit2(x)
u1 = u1;
u = u0;
unew = 0*u;
unew2 = 0*u1;


for i = 1:nt
    unew(2:end) = 2*(1-lambda^2).*u(2:end) + (lambda.^2) *(u1(2:end)+u(1:end-1))  - u(1:end-1);
    unew(1)   = u(1);
    unew2(1) = u1(1)
    u = unew;
    U(i,:)=u(:);
end

U=[u0;U];
T=0:dt:tend;


%Grafica Soluciones
figure(1)
set(gcf,'color','w');
surf(x,T,U)
shading interp
xlabel('x'), ylabel('t'), zlabel ('u(x,t)');
grid on 
%colormap('Gray');


function ui = uinit(x)
    ui = sin(pi*x)
end

function ut = uinit2(x)
    ut = 0*x
end
