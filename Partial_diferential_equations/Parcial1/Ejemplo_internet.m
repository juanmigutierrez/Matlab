clear;
set(gcf,'color','w');
% Simulating the inviscid Burgers' equation (1-D Convection) by the 
...Finite difference Method(a time march)
% Numerical scheme used is a first order upwind in space and time
%%
%Specifying Parameters
nx=100;             %Number of steps in space(x)
nt=100;              %Number of time steps 
dt=0.01;
xend = 5;%Width of each time step
dx = xend/(nx-1);        %Width of space step
x=-2:dx:xend;           %Range of x=(0,2) and specifying the grid points
u=zeros(1,nx);      %Preallocating u
un=zeros(1,nx);     %Preallocating un
%%
%Initial conditions: a sinusoidal wave
alpha = 2;
for i=1:(nx) % i=1:(nx-10)
      %u(i)=exp(-(2*(x(i)-1)).^2);
      %u(i)= sin(2*pi*x(i))
      u(i) = uinita(i,x(i),alpha);
end

%%
%Calculating the velocity profile at every time step
i=3:nx;
for it=0:nt
    un=u;
    %h=plot(x(1:100),u,'k');       %plotting the velocity profile
    h=plot(x(1:100),u,'k');
    title({'1-D Dimension';['tiempo(\itt) = ',num2str(dt*it)]})
    xlabel('Coordenadas espaciales x (x) \rightarrow')
    ylabel('Movimiento masa (u) \rightarrow')
    drawnow; 
    refreshdata(h)
    %Uncomment as necessary
    %------------------
    %Beam-Warming scheme(Explicit) 
    %u(i)= un(i)-(dt*u(i).*(3*un(i)-4*un(i-1)+un(i-2))/(2*dx))+(dt^2*(un(i).^2).*(un(i)-2*un(i-1)+un(i-2))/(2*dx*dx));
    u(i)= un(i)-dt/dx*(f(u(i))-f(u(i-1)));
    %------------------
    %FD in time and BD in space(Explicit):
    %u(i)=un(i)-(dt*(un(i).*(un(i)-un(i-1)))/dx);
end

function ui = uinit(i,x)
    %ui=exp(-(2*(x-1)).^2);
    %xshift = 0;
    %uL = 1;
    %uR = 0;
    %ui = uR + (uL-uR) * ((x(i)-xshift) <= 0.0);
    ui(i) = sin(2*pi*x)
end

function ret = f(u)
    ret = 0.5 * u.^2;
end

function ui = uinita(i,x,alpha)
    %ui=exp(-(2*(x-1)).^2);
    xshift = 0;
    uL = 0;
    uM = 2.*x;
    uR= 1;
    ui = (uR).*((x-xshift)  >= alpha)+(uM).*((x-xshift) > 0.0 & (x-xshift) < alpha)+(uL).*((x-xshift) <= 0.0);
end