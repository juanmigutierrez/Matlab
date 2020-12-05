% 1D-wave equation
% utt=c^2uxx ;  0<x<10 ,0<t<10
clc
clear all
tmax=10;t0=0;
nt=200;
dt=(tmax-t0)/nt; 
t=0;
xmax=10;x0=0;
nx=101;dx=(xmax-x0)/(nx-1);
x=0:dx:xmax;
c=2;
alpha=(c*dt/dx)^2;
u1=zeros(1,nx);u0=zeros(1,nx);
g=0;
    u0=sin(pi*x); % IC
%u0=exp(-10*(x-5).^2); 
% u=exp(-10*(x-5).^2);
% approximate the first time step
for i=2:nx-1;
u1(i)=(alpha/2)*u0(i+1)+(1-alpha)*u0(i)+(alpha/2)*u0(i-1)-2*dt*g;
end
t=t+dt;
% approximate the following time steps
while t<tmax
 u1(1)=0;u1(nx)=0;
 
 
%  unew(i)=-u0(i) + alpha*u(i+1) + 2*(1-alpha)*u(i) + alpha*u(i-1);
% u0=u;
% u=unew;
i=2:nx-1;
u(1)=0;u(nx)=0;
u(i)=(alpha)*u1(i+1)+2*(1-alpha)*u1(i)+(alpha)*u1(i-1)-u0(i);
u0=u1;
u1=u;
% plot(x,u);
% axis([x0 xmax -5 5])
% title(['solution at time t=',num2str(t)]);
% pause(0.01)
t=t+dt;
end
plot(x,u);
uexact= (sin(pi*(x-t))+sin(pi*(x+t)))/2; %exact solution
% plot(x,uexact)
 error=abs(u-uexact);