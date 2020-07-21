%% TALLER 3 %% 
N=3;
in = linspace(0,255,N);
in2 = linspace(255,255,N);

%%%% Creando Matriz Completa
Im = uint8(ones(N,1)*in);
Im2 = uint8(ones(N,1)*in2);
centro = round(N/2);
centrox = round(N/2);
centroy = centrox;
imshow(Im);
%%%% Transformacion coordenadas +1
transformacion = @(x,y) ndgrid(exp(x)*cos(y),exp(x)*sin(y));
transformacion2 = @(x,y) ndgrid(x-y,y-x);
%[posx,posy]=transformacion(1,1);
%Temp1(posx,posy)
%%% Ir por cada elemento y evaluar funcion
for row=1:size(Im,1);
    for col=1:size(Im,2);
       valor = Im(row,col);
       %Casos cuadricula
       %1er cuadrante
       % 1er cuadrante
       if row < centrox && col < centroy
           coord_x = col - centro;
           coord_y = centro-row;
       % 2do cuuadrante
       elseif row < centrox && col > centroy
           coord_x = col-centro;
           coord_y = centro - row;
       % 3er cuadrante
       elseif row >centrox && col < centroy
           coord_x = col - centro;
           coord_y = centro - row;
       % 4to cuadrante
       elseif row >= centrox && col >= centroy
           coord_x = col - centro;
           coord_y = centro - row;
       end
       
       %coord_x = coord_x;
       %coord_y = coord_y;
       
       %[coordx,coordy] = transformacion(coord_x,coord_y);
       row
       col
       coordx = coord_x
       coordy = coord_y
       
       %Volver a enviar a los cuadrantes
       if  coordx<0 && coordy>0
           rown = coord_x + centro;
           coln = centro - coordy;
       % 2do cuuadrante
       elseif coordx>0 && coordy>0
           rown = centro - coordy;
           coln = centro + coordx;
       % 3er cuadrante
       elseif coordx<0 && coordy<0
           rown = centro - coord_y;
           coln = centro - coordx;
       % 4to cuadrante
       elseif coord_x>=0 && coordy<=0
           rown = coord_x + centro;
           coln = centro - coordy;
       end
       
              
       rown = round(rown);
       coln = round(coln);
       
       %Convertir a numero entero por que la matriz solo tiene coordenadas
       %enteras
       if rown<255 && coln <255 && rown>0 && coln > 0
        Im2(rown,coln)=valor;
       end
    end
end
imshow(Im2);
