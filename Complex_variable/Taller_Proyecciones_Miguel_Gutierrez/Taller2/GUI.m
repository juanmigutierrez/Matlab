function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 07-Mar-2020 21:28:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin) %Inicializacion(Axes1,Axes2)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
handles;
axes(handles.axes4);
matlabImage = imread('rosario.png'); %En el archivo deberia estar la imagen rosario.png para que salga el logo
image(matlabImage);
axis off
axis image
% Choose default command line output for GUI
handles.output = hObject;
% Update handles structure
%Graficando Esfera de Riemann

guidata(hObject, handles);
set(handles.axes2,'YLim',[-5 5])
set(handles.axes2,'XLim',[-5 5])

xlabel(handles.axes2,'Real');
ylabel(handles.axes2,'Imaginario');

esfera1(handles.axes1); %Crear_esfera - Pseudocodogio
xlabel(handles.axes1,'X');
ylabel(handles.axes1,'Y');
zlabel(handles.axes1,'Z');

%Graficando Esfera de Riemann
%Permitiendo ginput
t = 0;
xtemp = [];
xtemp = NaN;
ytemp = NaN;
while(true)
    
[x,y,button]=ginputax([handles.axes2],1);%funcion que permite solo hacer ginput de una sola gráfica, sacada de internet para evitar molestias
if(button==3)
    x=NaN;
    y=NaN;
    xtemp = NaN;
    ytemp = NaN;
end
[l1,l2]=linea(x,y,xtemp,ytemp); %linea - Pseudocodigo
line([xtemp x],[ytemp,y],'Parent', handles.axes2);

t= t+1;
xtemp = x ;%Va guardando el temporal para hacer la linea
ytemp = y ;
hold( handles.axes2, 'on' );
plot(x,y,'k+','Parent', handles.axes2);
set(handles.axes2,'YLim',[-5 5]);
set(handles.axes2,'XLim',[-5 5]);
proyeccion(handles.axes1,l1,l2);
end
% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles) %Reinicia en 0 todo si se hace click en el boto "reset"
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
cla reset;
axes(handles.axes1);
cla reset;
esfera1(handles.axes1);
set(handles.axes2,'YLim',[-5 5]);
set(handles.axes2,'XLim',[-5 5]);

function [l1,l2]=linea(x,y,xtemp,ytemp)% sacar_linea Pseudo-codigo

x1 = x;
x2 = xtemp;
y1 = y;
y2 = ytemp;
coeficientes = polyfit([x2,x1],[y2,y1],1);
a = coeficientes(1);
b = coeficientes(2);
if(x1>x2)
    xp = linspace(x2,x1,100);
else
    xp = linspace(x1,x2,100);
end
l1 = xp.*a+b;
l2 = xp;

function proyeccion(object,x,y)% Proyeccion (X,Y) - Pseudocodigo
%%% Sacando Matriz Compleja
Z=complex(x,y);
%%% Sacando Matriz Compleja sus valores absolutos
abs1 = abs(Z); %Sacando la norma de cada valor de la matriz
%%%Proyección esfera de Riemman

x = 2*real(Z)./(abs1.^2+1);
y = 2*imag(Z)./(abs1.^2+1);
z = (abs1.^2-1)./(abs1.^2+1);
plot3(x,y,z,'Parent', object,'LineWidth',0.0001) %Poniendole color negro

function esfera1(object) %Crear_esfera - Pseudocodogio
 [X,Y,Z] = sphere(20);
 plot3(X,Y,Z,'LineStyle','--','color',[0.5,0.5,0.5],'Parent', object);
 hold( object, 'on' );
return

function esfera(object)
m = linspace(-100,100,100);
x = linspace(-100,100,100);
y = m.*x;
plot(y,x);
r = linspace(-10,10,1000); %Sacando parte real
im = linspace(-10,10,1000); %Sacando parte imaginaria

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
plot3(x,y,z,'Parent', object,'LineWidth',0.0001) %Poniendole color negro
hold( object, 'on' )
%%%Proyección esfera de Riemman

function  vector1=partir(vector1,indices)
for i=1:length(vector1)
    indexv = find(vector1==vector1(i)); %Sacando el indice del valor del vector pasado por argumento
    if(ismember(indexv,indices)==1); %Verificando si se dio click derecho
        vector1(i)=NaN ;%  Si se dio click derecho cambiarlo por NaN
    end
end
return
    
