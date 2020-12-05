sen = @(x) sin(2*pi*x);
T = 1;
N=50;
k=0.001;
h = T/N;
i= 1:N+1;
x= 1:N+1;
u= 1:N+1;
xi= @(i)(i-1)*h;
uu = @(xi,) sin(2*pi*x);
u(0)= sen(xi(1))

for j=1:N+1
    u(j+1)=u(j)-((1*k)/(2*h))*()
    








