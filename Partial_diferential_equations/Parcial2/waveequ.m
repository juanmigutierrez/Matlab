function varargout = waveequ(varargin)
% WAVEEQU MATLAB code for waveequ.fig
%      WAVEEQU, by itself, creates a new WAVEEQU or raises the existing
%      singleton*.
%
%      H = WAVEEQU returns the handle to a new WAVEEQU or the handle to
%      the existing singleton*.
%
%      WAVEEQU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVEEQU.M with the given input arguments.
%
%      WAVEEQU('Property','Value',...) creates a new WAVEEQU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI b4efore waveequ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to waveequ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help waveequ

% Last Modified by GUIDE v2.5 10-Jan-2016 12:23:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @waveequ_OpeningFcn, ...
                   'gui_OutputFcn',  @waveequ_OutputFcn, ...
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


% --- Executes just before waveequ is made visible.
function waveequ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to waveequ (see VARARGIN)

% Choose default command line output for waveequ
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes waveequ wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = waveequ_OutputFcn(hObject, eventdata, handles) 
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
n=40;
m=100;
u=zeros(n,n,m);

    coswave=get(handles.radiobutton1,'Value');
    sinwave=get(handles.radiobutton2,'Value');
    tanwave=get(handles.radiobutton3,'Value');
    ewave=get(handles.radiobutton4,'Value');
    stepwave=get(handles.radiobutton5,'Value');
    pulswave=get(handles.radiobutton6,'Value');
    if coswave
        for i=1:20
             x=18*i;
             u(:,i,2)=cos(x);
        end
    elseif sinwave
        for i=1:20
             x=18*i;
             u(:,i,2)=sin(x);
        end
    elseif tanwave
        for i=1:20
             x=2.25*i;
             u(:,i,2)=tan(x);
        end
    elseif ewave
        for i=1:20
             x=0.01*i;
             u(:,i,2)=exp(x);
        end
    elseif stepwave
        for i=1:5
             u(:,i,2)=1;
        end
        for i=6:10
             u(:,i,2)=0;
        end
        for i=11:15
             u(:,i,2)=1;
        end
        for i=16:20
             u(:,i,2)=0;
        end
    else
        u(20,20,1)=10;
    end
 
%for i=1:20
 %    x=0.1*i;
  %   u(:,i,2)=cos(x)+sin(x);
 %end
 
%u(20,20,1)=20;
dt=0.1;
dh=0.16;
c=1;
for k=2:m-1
    for j=2:n-1
        for i=2:n-1
            
            u(i,j,k+1)=2*u(i,j,k)-u(i,j,k-1)+(dt^2*c^2/dh^2)*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k)-4*u(i,j,k));
            
        end
    end
end
% u=double(u);
% u=reshape(u,20*20,20);


axes(handles.axes1);
X=0:.1:(0.1*(n-1));
Y=0:.1:(0.1*(n-1));
% [X,Y] = meshgrid(x,y);
for i=1:m
    surf(X,Y,u(:,:,i));
     view(0,90)
    zlim([-20 20]);
    drawnow
    pause(0.08);
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=40;
m=100;
u=zeros(n,n,m);

    coswave=get(handles.radiobutton1,'Value');
    sinwave=get(handles.radiobutton2,'Value');
    tanwave=get(handles.radiobutton3,'Value');
    ewave=get(handles.radiobutton4,'Value');
    stepwave=get(handles.radiobutton5,'Value');
    pulswave=get(handles.radiobutton6,'Value');
    if coswave
        for i=1:20
             x=18*i;
             u(:,i,2)=cos(x);
        end
    elseif sinwave
        for i=1:20
             x=18*i;
             u(:,i,2)=sin(x);
        end
    elseif tanwave
        for i=1:20
             x=2.25*i;
             u(:,i,2)=tan(x);
        end
    elseif ewave
        for i=1:20
             x=0.01*i;
             u(:,i,2)=exp(x);
        end
    elseif stepwave
        for i=1:5
             u(:,i,2)=1;
        end
        for i=6:10
             u(:,i,2)=0;
        end
        for i=11:15
             u(:,i,2)=1;
        end
        for i=16:20
             u(:,i,2)=0;
        end
    else
        u(20,20,1)=10;
    end
 
%for i=1:20
 %    x=0.1*i;
  %   u(:,i,2)=cos(x)+sin(x);
 %end
 
%u(20,20,1)=20;
dt=0.1;
dh=0.16;
c=1;
for k=2:m-1
    for j=2:n-1
        for i=2:n-1
            
            u(i,j,k+1)=2*u(i,j,k)-u(i,j,k-1)+(dt^2*c^2/dh^2)*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k)-4*u(i,j,k));
            
        end
    end
end
% u=double(u);
% u=reshape(u,20*20,20);


axes(handles.axes1);
X=0:.1:(0.1*(n-1));
Y=0:.1:(0.1*(n-1));
% [X,Y] = meshgrid(x,y);
for i=1:m
    surf(X,Y,u(:,:,i));
     view(180,0)
    zlim([-20 20]);
    drawnow
    pause(0.08);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
view(45,45)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=40;
m=100;
u=zeros(n,n,m);

    coswave=get(handles.radiobutton1,'Value');
    sinwave=get(handles.radiobutton2,'Value');
    tanwave=get(handles.radiobutton3,'Value');
    ewave=get(handles.radiobutton4,'Value');
    stepwave=get(handles.radiobutton5,'Value');
    pulswave=get(handles.radiobutton6,'Value');
    if coswave
        for i=1:20
             x=18*i;
             u(:,i,2)=cos(x);
        end
    elseif sinwave
        for i=1:20
             x=18*i;
             u(:,i,2)=sin(x);
        end
    elseif tanwave
        for i=1:20
             x=2.25*i;
             u(:,i,2)=tan(x);
        end
    elseif ewave
        for i=1:20
             x=0.01*i;
             u(:,i,2)=exp(x);
        end
    elseif stepwave
        for i=1:5
             u(:,i,2)=1;
        end
        for i=6:10
             u(:,i,2)=0;
        end
        for i=11:15
             u(:,i,2)=1;
        end
        for i=16:20
             u(:,i,2)=0;
        end
    else
        u(20,20,1)=10;
    end
 
%for i=1:20
 %    x=0.1*i;
  %   u(:,i,2)=cos(x)+sin(x);
 %end
 
%u(20,20,1)=20;
dt=0.1;
dh=0.16;
c=1;
for k=2:m-1
    for j=2:n-1
        for i=2:n-1
            
            u(i,j,k+1)=2*u(i,j,k)-u(i,j,k-1)+(dt^2*c^2/dh^2)*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k)-4*u(i,j,k));
            
        end
    end
end
% u=double(u);
% u=reshape(u,20*20,20);


axes(handles.axes1);
X=0:.1:(0.1*(n-1));
Y=0:.1:(0.1*(n-1));
% [X,Y] = meshgrid(x,y);
for i=1:m
    surf(X,Y,u(:,:,i));
     %view(180,0)
    zlim([-20 20]);
    drawnow
    pause(0.08);
end
            
