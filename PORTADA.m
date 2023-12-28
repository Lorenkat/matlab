function varargout = PORTADA(varargin)
% PORTADA MATLAB code for PORTADA.fig
%      PORTADA, by itself, creates a new PORTADA or raises the existing
%      singleton*.
%
%      H = PORTADA returns the handle to a new PORTADA or the handle to
%      the existing singleton*.
%
%      PORTADA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PORTADA.M with the given input arguments.
%
%      PORTADA('Property','Value',...) creates a new PORTADA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PORTADA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PORTADA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PORTADA

% Last Modified by GUIDE v2.5 16-Dec-2023 18:07:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PORTADA_OpeningFcn, ...
                   'gui_OutputFcn',  @PORTADA_OutputFcn, ...
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


% --- Executes just before PORTADA is made visible.
function PORTADA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.

% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PORTADA (see VARARGIN)
axes (handles.axes1)
background =imread("´ISTH.jpg");
axis off;
imshow(background);

% Choose default command line output for PORTADA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PORTADA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PORTADA_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in PROGRAMA.
 function PROGRAMA_Callback(hObject, eventdata, handles)
 cost321prog2fig

 
% hObject    handle to PROGRAMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
