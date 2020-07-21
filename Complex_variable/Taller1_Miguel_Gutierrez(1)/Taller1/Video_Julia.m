


cx = -0.8;
cy = 0.156;

v = VideoWriter('Julia_n.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
v.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video
v.Quality = 100;
n = 2
open(v); %par iniciar a adicionar las imágenes en v

for n =2:0.01:5 % m es la pendiente de la línea
    IT = Julia1(cx,cy,n); %variable dependite de la línea
    imagesc(IT);
    F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
    writeVideo(v,F); %adicionamos el frame a 'v'
end
close(v);
"listo"

function Z=Julia1(cx,cy,n);

max_iteration = 255;

a = 1.5;
b = 1.5;
x=linspace(-a,a,500);%1xN
y=linspace(-b,b,500);%1xM

M = length(y);
N=  length(y);
X = ones(M,1)*x;
Y = y'*ones(1,N);
Z=complex(X,Y);
Z1=Z;
IT = Z;

R = sqrt(cx^2+cy^2)^(n)-sqrt(cx^2+cy^2)+10; %elegir R > 0 tal que that R**n - R >= sqrt(cx**2 + cy**2)

for row=1:size(Z1,1)
    for col=1:size(Z1,2)
        valor = Z1(row,col);
        IT(row,col)=iteracion(real(valor),imag(valor),max_iteration,n,R,cx,cy);
    end
end

Z=IT;
end

function r= iteracion(Px,Py,max_iteration,n,R,cx,cy);
    x = Px;
    y = Py;
    iteration = 0;
    while sqrt(x.^2+y.^2)< R^2 && iteration < max_iteration
        
        xtemp = (x^2+y^2)^(n/2)*cos(n*atan2(y,x))+cx;
        y = (x^2+y^2)^(n/2)*sin(n*atan2(y,x))+cy;
        x = xtemp;
        iteration = iteration +1;
        
    end 
    r = iteration;
end