%% TALLER 3 %% 
N=255;
in = linspace(0,255,N);
in2 = linspace(NaN,NaN,N);
mx = linspace(-1,1,N);
my = linspace(pi,-pi,N);

%%%% Creando Matriz Completa
Im = uint8(ones(N,1)*in);
coordx1 = ones(N,1)*mx;
coordy1 = my'*ones(1,N);
Im2 = ones(N,1)*in2;
centro = round(N/2);
centrox = centro;
centroy = centro;
tamano = size(Im);
row = tamano(1);
col = tamano(2);
% Creando matriz tridimensional valor,coordenadas x y y
Tri = Im;
Tri(:,:,2)=coordx1;
Tri(:,:,3)=coordy1;
figure(1)
%imshow(Im);
%%%% Transformacion coordenadas +1
%transformacion1x = @(x,y) ndgrid(exp(x)*cos(y));
%transformacion1y = @(y) ndgrid(exp(x)*sin(y));
%transformacion1 = @(x,y) ndgrid(exp(x)*cos(y),exp(x)*sin(y));
coordx = NaN;
%[posx,posy]=transformacion(1,1);
%Temp1(posx,posy)
coordx2= exp(coordx1).*cos(coordy1);
coordy2 = exp(coordx1).*sin(coordy1);

%coordx2 = round(coordx2*centro);
%coordy2 = round(coordy2*centro);

Tri(:,:,2)=coordx2;
Tri(:,:,3)=coordy2;

       
maxx=max(coordx2);
minx=min(coordx2);
       
maxy=max(coordy2);
miny=min(coordy2);

rown = (minx)/2 - coordx2;
coln = (miny)/2 + coordy2;

rown = round(rown);
coln = round(coln);

%ind = sub2ind(size(Im),rown,coln)

%Im2(rown.,col.n) = Im(rown.,col.)
%figure(2)
%imshow(Im2);