%% Primer Problema
clear;
clf

xend = 3; %tamaño eje x
tend = 3; %tamaño eje y
N = 100; % Numero de puntos grilla
dx = xend/N;
dt= 0.01;

x = 0:dx:xend;
nt = floor(tend/dt);
nx = floor(xend/dx)
dt = tend/ nt; %k
alpha = 1/2;
%Soluciones iniciales
%u0 = uinita(x,alpha);
u0 = uinit(x);
u = u0;
unew = 0*u;

for i = 1:nt
    unew(2:end) = u(2:end) - dt/dx * u(2:end) .* (u(2:end) - u(1:end-1));
    unew(1)   = u(1);    %u(3:end): subvector de u desde 3 hasta el final.
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

%% Lineas Caracteristica
figure(2)
set(gcf,'color','w');
loyolagreen = 1/255*[0,104,87];
hold on
for j= 1:length(x)
    T=0:dt:tend;
    ui = x(j);
    x1 = x0(T,ui);
    plot(T,x1,'Color', loyolagreen, 'LineWidth',0.2);
end
xlabel('t'), ylabel('x')

%% Solucion Riemann
x;
T;
for j = 1:length(x)
    for t=1:nt
        if x(j) <T(t)/2
          U1(t,j)=1; 
        else
          U1(t,j)=0;  
        end
    end    
end
%u = u0;
%U1=[u0;U1];
%xlabel('t'), ylabel('x')
%Grafica Soluciones
%figure(3)
%set(gcf,'color','w');
%surf(x,T,U1)
%shading interp
%xlabel('x'), ylabel('t'), zlabel ('u(x,t)');
%grid on 

%% FUNCIONES --------------------------------------
function ui = uinit(x)
    xshift = 0;
    %ui=exp(-(2*(x-1)).^2);
    %ui = sin(2*pi*x);
    uL = 1;
    uR = x;
    ui = uR + (uL) * ((x-xshift) <= 0.0);
end

function ret = f(u)
    ret = 0.5 * u.^2;
end

%funciones lineas caracteristicas
function ret = x0(t,x_0)
    ret = x_0+uinit(x_0)*t;
end

function ui = uinita(x,alpha)
    %ui=exp(-(2*(x-1)).^2);
    xshift = 0;
    uL = 0;
    uM = 2.*x;
    uR= 1;
    ui = (uR).*((x-xshift)  >= alpha)+(uM).*((x-xshift) > 0.0 & (x-xshift) <= alpha)+(uL).*((x-xshift) <= 0.0);
end

