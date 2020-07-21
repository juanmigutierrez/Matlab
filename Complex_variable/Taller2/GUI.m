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
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
%Graficando Esfera de Riemann
guidata(hObject, handles);
set(handles.axes1,'YLim',[-5 5])
set(handles.axes1,'XLim',[-5 5])
esfera(handles.axes1)
%Graficando Esfera de Riemann

%Permitiendo ginput
[x,y,button]=ginputax([handles.axes2],3); %funcion que permite solo hacer ginput de una sola gráfica.
indices = find(button==3)
x=partir(x,indices)
y=partir(y,indices)
plot(x,y,'Parent', handles.axes2)
proyeccion(handles.axes1,x,y)
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
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function proyeccion(object,x,y)
%%% Sacando Matriz Compleja
M = length(x);
N=  length(y);
X = ones(M,1).*x;
Y = y'.*ones(1,N);
Z=complex(X,Y');
%%% Sacando Matriz ComplejWa
abs1 = abs(Z); %Sacando la norma de cada valor de la matriz
%%%Proyección esfera de Riemman

x = 2*real(Z)./(abs1.^2+1)
y = 2*imag(Z)./(abs1.^2+1)
z = (2*abs1.^2-1)./(abs1.^2+1)
plot3(x,y,z,'Parent', object,'LineWidth',0.0001) %Poniendole color negro

function esfera(object)
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
    
