%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMER PUNTO %%%%%%%%%%%%%%%%%%%%%%%
set(0,'defaultfigurecolor',[1 1 1])
N=100;
r=2;
c = 0;
x = linspace(-2,2,N); %Siguiente parte de 2 a -2
y = sqrt(r^2-(x-c).^2);
muestra = 1:2*N;

yn = -y;
xn = x.*-1;

X = [x xn];
Y = [y yn];
%TranformacionFurier(X,Y,N);

%%%%%%%%%%%%%%%%%%%%%%%%%%% PUNTO SEGUNDO %%%%%%%%%%%%%%

a = 1;

t = 1:2*N;

X2= a*(2*cos(t)-cos(2*t))-1.5; % Genero X1
Y2 = a*(2*sin(t)-sin(2*t))-1.5; % Genero Y1

%TranformacionFurier1(X2,Y2,2*N,100,200)



%%%% FIGURA 2
N = 200;
x3 = linspace(-1,1,N);
y3 = abs(x3);

TranformacionFurier1(x3,y3,N,20,180)

%%%% FIGURA 3 %%%%

N = 1000;
t = linspace(0,12*pi,N);

X1=sin(t).*(exp(cos(t))-2.*cos(4*t)-(sin(t/12).^5));
Y1=cos(t).*(exp(cos(t))-2.*cos(4*t)-(sin(t/12).^5));
Y2 = -Y1;

X1 = [X1 X1];
Y1 = [Y1 Y2];

%TranformacionFurier1(X1,Y1,2*N,100,1900)

%%% FIGURA 4 %%%%

N = 50;
a = linspace(0,5,N);
teta = linspace(0,100*pi,N);
t = linspace(0,12*pi,N);
X5 = a.*cos(t+teta).^3;
Y5 = a.*sin(t+teta).^3;

%TranformacionFurier1(X5,Y5,N,35,50)




