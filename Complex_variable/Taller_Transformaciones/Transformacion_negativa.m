%% TALLER 3 %% CODIGO SE DEMORA UN RATO

%%% TRANSFORMACION NEGATIVOS
% f(z)=-z


%%Transformacion negativos
N=1025; % Creo el n para generar el tamaño de la matriz NxN
in = linspace(0,255,N); % Creo un vector de valores 0...255, en un intervalo de N espacios
in2 = linspace(NaN,NaN,N);  % Creo un vector de valores NaN, N veces
mx = linspace(-1,1,N); % Creo un vector de valores -1...1, en un intervalo de N espacios
my = linspace(-pi,pi,N); % Creo un vector de valores -pi...pi, en un intervalo de N espacios

%%%% Creando Matriz Completa
Im = uint8(ones(N,1)*in); % Se crea la matriz de degrade de izquierda a derecha
Im2 = (ones(N,1)*in2); % Creo una imagen que posee valores vacios
coordx1 = ones(N,1)*mx; %Creo la matriz de coordenadas de x [-1,1]
coordy1 = ones(N,1)*my; %Creo la matriz de coordenadas de x [pi-pi]
rown0 = coordx1; %Creo una matriz de filas
coln0 = coordy1;%Creo una matriz de columnas

coordx2 = ones(N,1)*mx; %Creo una matriz donde van a ir las coordenadas x transformadas
coordy2 = ones(N,1)*my; %Creo una matriz donde van a ir las coordenadas y transformadas
rown1 = coordx2; %Creo una matriz de filas nuevas que cooresponderan a las nuevas coordenadas transformadas
coln1 = coordy2; %Creo una matriz de columnas nuevas que cooresponderan a las nuevas coordenadas transformadas

centro = round((N-1)/2); % Hallo el centro encontrado en N-1/2

figure(1)
imshow(Im); % Grafico primero la imagen original
title('Imagen Orignal')

%%%% Transformacion coordenadas %%%%%%

transformacion1 = @(x,y) ndgrid(exp(x)*cos(y),exp(x)*sin(y)); %Creo la funcion de transformacion de euler en variable compleja f=exp(z)
transformacion2 = @(x,y) ndgrid(-x,-y);  %Creo la funcion de transformacion negativa en variable compleja f(z)=-z


coordx = NaN;
%[posx,posy]=transformacion(1,1);
%Temp1(posx,posy)
%%% Ir por cada elemento y evaluar funcion
for row=1:size(Im,1);
    for col=1:size(Im,2);
       coordx = NaN; % Es necesario volver a convertir las coordenadas a sin valor
       coordy = NaN; % Es necesario volver a convertir las coordenadas a sin valor
       
       valor = Im(row,col); % Obtengo el valor de intensidad de la imagen de la columna y fila determinada de la Imagen original
       rown0(row,col)=row; % Guardo el valor en la primera matriz de filas
       coln0(row,col)=col; % Guardo el valor en la primera matriz de columnas
       
       %Transformar de indices de matrices a coordenadas
       coord_x = col - (N+1)/2; % Es una formula que permite convertir de columnas a coordenas x
       coord_y = -row + (N+1)/2; % Es una formula que permite convertir de filas a coordenas y
       
       %Acotarla
       coord_x = coord_x; % Multiplicado por 32, para que obtenga mayor resolucion y se vea en toda la imagen mas parecida a la que se quiere obtener
       coord_y = coord_y; % Normalizo las coordenasa y a los limtes que se quieren
       
       coordx1(row,col)=coord_x; %Guardo la informacion de las coordenadas en su respectiva matriz
       coordy1(row,col)=coord_y; %Guardo la informacion de las coordenadas en su respectiva matriz

       [coord_x,coord_y] = transformacion2(coord_x,coord_y);%Se realiza la transformacion de las coordenadas
       
       %coord_x = coord_x*exp(3);%Luego es necesario multiplicarlo pos su valor maximo que es exp(3)*1, tener en cuenta que se que es exp(3)sin(y) o exp(3)cos(y)
       %coord_y = coord_y*exp(3);%Luego es necesario multiplicarlo pos su valor maximo que es exp(3)*1
       
       coordx2(row,col)=coord_x; %Guardando al informacion en la nueva matriz de coordenadas x
       coordy2(row,col)=coord_y; %Guardando al informacion en la nueva matriz de coordenadas x
       
       %Transformar de coordenadas a indices
       rown = (N+1)/2 - coord_y; %Aplicando la transofrmacion inversa, de la formula prevista anteriormente
       coln = (N+1)/2 + coord_x; %Aplicando la transofrmacion inversa, de la formula prevista anteriormente
       
       rown1(row,col) = round(rown); %Redondeando a entero el numero obtenido para poder ser evaluado en las posiciones de la matriz
       coln1(row,col) = round(coln); %Redondeando a entero el numero obtenido para poder ser evaluado en las posiciones de la matriz

       
       rown = round(rown); %Redondeando a entero el numero obtenido para poder ser evaluado en las posiciones de la matriz
       coln = round(coln); %Redondeando a entero el numero obtenido para poder ser evaluado en las posiciones de la matriz
       
       %enteras, si cumple la condicion entonces se remplaza, si se sale de
       %la matriz entonces no
       if rown<=N && coln <=N && rown>0 && coln > 0
        Im2(rown,coln) = valor;
       end
    end
end

%%%%%% Interopolación de datos faltantes
Im2=uint8(Im2); %Convirtiendo imagen a imagen de 8 bits

figure(2)
imshow(Im2);
title('Imagen Transformada f(z)=-z')
%imag = zeros(size(I))
%imideal) = y:ideal