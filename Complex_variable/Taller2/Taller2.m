x = [];
cx = 0;
cy = 0; %Puntos centrados
r = 100;
x = linspace(cx-r,cx+r,100);
y = sqrt(r.^2-(x-cx).^2);
ym = -y;

X = [x NaN x]; %Creando eje x circulo
Y = [y NaN ym]; %Creando eje y Circulo

seg = 1:100;

%plot(X,Y)

%Cardoide

a = 1;
phi = 30;
t = 1:100;

x1= a*(2*cos(t)-cos(2*t));
y1 = a*(2*sin(t)-sin(2*t));

%plot(x1,y1)

%Corazon
t1=linspace(0,2*pi,100); %creando angulos
Y2=[]
X2=[]

for e=1:10:100
    c1 = X(e)
    c2 = Y(e)
    x2 = gra_centrox(c1,c2,t1);
    y2 = gra_centroy(c1,c2,t1);
    X2 = [X2 x2 NaN];
    Y2 = [Y2 y2 NaN];
end

plot(X2,Y2)

function x2=gra_centrox(cx,cy,t1)
    x2 = cx+15*sin(t1).^3; %centro cx
    %y2 = cy+13*cos(t1)-5*cos(2*t1)-2*cos(3*t1)-cos(4*t1) %centro cy
    return
end

function y2=gra_centroy(cx,cy,t1)
    %x2 = cx+15*sin(t1).^3 %centro cx
    y2 = cy+13*cos(t1)-5*cos(2*t1)-2*cos(3*t1)-cos(4*t1); %centro cy
    return
end
    


