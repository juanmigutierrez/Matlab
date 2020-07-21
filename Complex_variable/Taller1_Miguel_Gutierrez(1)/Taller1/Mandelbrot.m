

max_iteration = 255;

a = 2;
b = 2;
x=linspace(-a,a,1000);%1xN
y=linspace(-b,b,1000);%1xM

M = length(y);
N=  length(y);
X = ones(M,1)*x;
Y = y'*ones(1,N);
Z=complex(X,Y);
Z1=Z;
IT = Z;

for row=1:size(Z1,1);
    for col=1:size(Z1,2);
        valor = Z1(row,col);
        IT(row,col)=iteracion(real(valor),imag(valor),max_iteration);
      end
end
IT
image(IT)

function r= iteracion(Px,Py,max_iteration)
    x = Px;
    y = Py;
    iteration = 0;
    x0 = Px;
    y0 = Py;
    while sqrt(x.^2+y.^2)< 2 & iteration < max_iteration
        xtemp = x.^2-y.^2+x0;
        y = 2.*x.*y+y0;
        x = xtemp;
        iteration = iteration +1;
    end 
    r = iteration;
end