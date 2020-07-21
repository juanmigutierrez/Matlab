%% TALLER 3 %% 
N=255;
in = linspace(0,255,N);
in2 = linspace(NaN,NaN,N);

%%%% Creando Matriz Completa
Im = uint8(ones(N,1)*in);
Im2 = (ones(N,1)*in2);
centro = round(N/2);
centrox = centro;
centroy = centro;
figure(1)
imshow(Im);
%%%% Transformacion coordenadas +1

transformacion1 = @(x,y) ndgrid(exp(x)*cos(y),exp(x)*sin(y));

transformacion2 = @(x,y) ndgrid(-x,-y);
coordx = NaN;
%[posx,posy]=transformacion(1,1);
%Temp1(posx,posy)
%%% Ir por cada elemento y evaluar funcion
for row=1:size(Im,1);
    for col=1:size(Im,2);
       coordx = NaN;
       coordy = NaN;
       valor = Im(row,col);
       
       
       %Transformar de indices de matrices a coordenadas
       coord_x = col - (N+1)/2;
       coord_y = -row + (N+1)/2;
       
       %Acotarla
       %coord_x = coord_x/centro;
       %coord_y = coord_y*pi/centro;

       [coord_x,coord_y] = transformacion2(coord_x,coord_y);
 
       coord_x = coord_x;
       coord_y = coord_y;
       
       %Transformar de coordenadas a indices
       
       rown = (N+1)/2 - coord_y;
       coln = (N+1)/2 + coord_x;
       
       rown = round(rown);
       coln = round(coln);
       
       %enteras
       if rown<=N && coln <=N && rown>0 && coln > 0
        Im2(rown,coln) = valor;
       end
    end
end

figure(2)
imshow(Im2);

%imag = zeros(size(I))
%imideal) = y:ideal