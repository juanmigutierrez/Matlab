%% Primer Problema
clear;
clf

N = 50; %number of points
limit = 1;
h = limit/N;

X = 0:h:limit;
Y = 0:h:limit;
k = 0.01;

Z = metod(X,k,h);
surf(X,Y,Z)

shading interp
xlabel('x'), ylabel('t'), zlabel ('u(x,t)'),title('Metodo Numerico');

grid on
function [U] = metod(X,k,h)
    U = 0*X'*X;
    U(1,:) = sin(2*pi*X);
    for n = 2:length(X)
        unew = 0*X;
        for i=2:length(X)-1
            unew(1) = U(i,n-1) - ((k/(2*h)).*U(i+1,n)- U(n-1,n-1));
            unew(i) = U(i,n-1) - ((k/(2*h)).*U(i+1,n)- U(i-1,n-1));
            unew(i+1) = U(i,n-1) - ((k/(2*h)).*U(1,n)- U(i-1,n-1));
        end
        
        U(n,:) = unew;
    end
end