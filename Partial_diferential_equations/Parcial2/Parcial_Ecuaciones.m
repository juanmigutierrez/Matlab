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


for j = 1:nt
    for i = 2:nx-1
        unew(2:end) = u(2:end) - dt/dx * u(2:end) .* (u(2:end) - u(1:end-1));
        unew(1)   = u(1);    %u(3:end): subvector de u desde 3 hasta el final.
        u = unew;
        U(i,:)=u(:);
    end
end