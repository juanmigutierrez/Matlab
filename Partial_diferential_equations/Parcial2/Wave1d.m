% This program describes a moving 1-D wave
% using the finite difference method
clc
close all;
clear all;
%-------------------------------------------------------------------------%
% Initialization
Nx = 101;       % x-Grids
dx = 1;         % Step size
x(:,1) = (0:Nx-1)*dx;
mpx = (Nx+1)/2; % Mid point of x axis
                % ( Mid pt of 1 to 101 = 51 here )
                
T = 1001;       % Total number of time steps
f = 10;         % frequency of source
dt = 0.001;     % Time-Step
t(:,1)= (0:T-1)*dt;
v = 500;        % Wave velocity
c = v*(dt/dx);  % CFL condition
U = zeros(T,Nx);  % U(x,t) = U(space,time)
s1 = floor(T/f);  
%-------------------------------------------------------------------------%
% Initial condition
U((1:s1),1) = sin(pi*f.*t(1:s1));
U((1:s1),2) = sin(pi*f.*t(1:s1));
%-------------------------------------------------------------------------%
% Finite Difference Scheme
for j = 3:T
    for i = 2:Nx-1
        U1 = 2*U(j-1,i)-U(j-2,i);
        U2 = U(j-1,i-1)-2*U(j-1,i)+U(j-1,i+1);
        U(j,i) = U1 + c*c.*U2;    
    end                   
end
%-------------------------------------------------------------------------%

figure
set(gcf,'color','w');
surf(x,t,U);
shading interp;
grid on;


% for n = 1:length(t)
%     plot(x,U(n,:));
%     pause(0.1)
% end