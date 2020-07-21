r = linspace(-10,10,100); %Sacando parte real
im = linspace(-10,10,100); %Sacando parte imaginaria

%%% Sacando Matriz Compleja
M = length(r);
N=  length(im);
X = ones(M,1)*r;
Y = im'*ones(1,N);
Z=complex(X,Y);
%%% Sacando Matriz Compleja

abs1 = abs(Z); %Sacando la norma de cada valor de la matriz
%%%Proyección esfera de Riemman

x = 2*real(Z)./(abs1.^2+1);
y = 2*imag(Z)./(abs1.^2+1);
z = (2*abs1.^2-1)./(abs1.^2+1);

mesh(x,y,z,'edgecolor','black') %Poniendole color negro
%%%Proyección esfera de Riemman
