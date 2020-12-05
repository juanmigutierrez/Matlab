clear;

r=1; %radio
h0=4;%altura
x=0; %coordenada x del centro
y=0; %cooordenada y del centro

[X,Y,Z]=cylinder([0,r]);
figure()
shading interp

surf(X+x,Y+y,Z*h0,'facecolor','b','FaceAlpha',0.5,'Edgecolor','none')
xlabel('x'), ylabel('y'), zlabel ('z');
grid on 
xlim([-2,2])
ylim([-2,2])
zlim([0,10])
view(60,30)


t0=0; %tiempo inicial
tf=10; %tiempo final
x0=4;%altura llenado inicial
[t,h]=ode45(@ODEx,[t0,tf],x0);

plot(t,h)

v = VideoWriter('punto3cono.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
v.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video

open(v); %par iniciar a adicionar las imágenes en v

for i = 1:length(h) % m es la pendiente de la línea
    r0 = (r/h0)*abs(h(i))
    
    [X,Y,Z]=cylinder([0,r0]);
    surf(X+x,Y+y,Z*h(i),'facecolor','b','FaceAlpha',0.5)
    hold on
    %fill3(X(1,:),Y(1,:),Z(1,:),'b')
    xlim([-2,2])
    ylim([-2,2])
    zlim([0,10])
    view(60,30)

    F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
    writeVideo(v,F); %adicionamos el frame a 'v'
end

close(v);

function xp = ODEx(t,x)
    r = 3;
    x0 = 4;
    alpha = 2;
    area = (pi*3^2*x^2)/(4^2);
    xp = 0.5-(alpha*sqrt(2*9.8*x))/area; %Altura 4
end