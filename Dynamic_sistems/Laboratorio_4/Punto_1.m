% preliminares: creación de vieo
% 
x=(-1:0.01:1); %creamos la variable independiente para graficar la línea

v = VideoWriter('punto1.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
v.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video

open(v); %par iniciar a adicionar las imágenes en v

for m =0:0.01:1 % m es la pendiente de la línea
    y = m; %variable dependite de la línea
    plot(m,y,'Marker','o','MarkerSize',10)
    xlim([-0.1, 1.1]); %fijamos los límites del eje x de la gráfica
    ylim([-0.1, 1.1]); %fijamos los límites del eje y de la gráfica
    F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
    writeVideo(v,F); %adicionamos el frame a 'v'
end

close(v); % finalizamos el video
