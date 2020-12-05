clear all;


%Dominio
L = 4;
dx=0.1;
nx= fix(L/dx);
x=linspace(0,L,nx);

%Tiempo

T=4;
CFL=0.8
alpha = 1
dt = CFL*dx/alpha
nt = fix(T/dt)
t =linspace(0,T,nt)

%Variables
wn = zeros(nx,nt);

S = zeros(nx,nt);
%Sol analatica
for i=1:nx-1;
   for j=1:nt-1;
      S(i,j)=sin(pi*x(i))*cos(2*pi*t(j));
   end
end

set(gcf,'color','w');
surf(t,x,S);
shading interp;
grid on;

function ui = f(x)
    %ui=exp(-(2*(x-1)).^2);
    uL = 3*exp(-(x-2)^2/0.1);
    uR= 0;
    ui = (uR).*(x  < 4)+(uL).*(x >=4);
end
