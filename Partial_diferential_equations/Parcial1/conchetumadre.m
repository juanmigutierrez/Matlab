%% Primer Problema
clear;
clf

N = 100; %number of points
limit = 1;
h = limit/N;

X = 0:h:limit;
Y = 0:h:limit;
k = 0.01;
set(gcf,'color','w');
Z = f2141(h,limit);
surf(X,Y,Z)

shading interp
xlabel('x'), ylabel('t'), zlabel ('u(x,t)')

grid on


function Z = f2141(dx,limit)
    [X,Y] = meshgrid(0:dx:limit);
    Z = X'*Y*0;
    for x = 1:length(X)
        for y = 1:length(X)
            if X(x,y)<=0
                Z(x,y) = 0;
            elseif X(x,y) > 0 && 1+4*X(x,y)*Y(x,y)>0
                Z(x,y) = (-1+sqrt(1+4*X(x,y)*Y(x,y)))/(2*Y(x,y));
            end
        end
    end 
end