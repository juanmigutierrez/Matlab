clear all;
wn = zeros(nx,1)
wnp1=wn;
wnp1=wn;
CFL =1;
c=1;
dt=CFL*dx/c;

wn=(49:51)=[0.1 0.2 0.1];
wnp1(:)