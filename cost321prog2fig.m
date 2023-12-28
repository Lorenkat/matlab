function varargout = cost321prog2fig(varargin)
% COST321PROG2FIG MATLAB code for cost321prog2fig.fig
%      COST321PROG2FIG, by itself, creates a new COST321PROG2FIG or raises the existing
%      singleton*.
%
%      H = COST321PROG2FIG returns the handle to a new COST321PROG2FIG or the handle to
%      the existing singleton*.
%
%      COST321PROG2FIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COST321PROG2FIG.M with the given input arguments.
%
%      COST321PROG2FIG('Property','Value',...) creates a new COST321PROG2FIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cost321prog2fig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cost321prog2fig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cost321prog2fig

% Last Modified by GUIDE v2.5 25-Dec-2023 14:16:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cost321prog2fig_OpeningFcn, ...
                   'gui_OutputFcn',  @cost321prog2fig_OutputFcn, ...
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


% --- Executes just before cost321prog2fig is made visible.
function cost321prog2fig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cost321prog2fig (see VARARGIN)

% Choose default command line output for cost321prog2fig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cost321prog2fig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cost321prog2fig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
close
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in borrar.
function borrar_Callback(hObject, eventdata, handles)
% hObject    handle to borrar (see GCBO)
set(handles.edificio1,'String','');
set(handles.base1,'String','');
set(handles.movil1,'String','');
set(handles.separacion1,'String','');
set(handles.text138,'String','');
set(handles.distancia1,'String','');
set(handles.frecuencia1,'String','');
set(handles.angulo1,'String','');
set(handles.atenuacion1,'String','');
se(handles.difraccion1,'String','');
set(handles.multipantalla1,'String','');
set(handles.espacio1,'String','');
set(handles.vista1,'String','');
set(handles.vista2,'String','');
set(handles.atenuacion2,'String','');
set(handles.difraccion2,'String','');
set(handles.multipantalla2,'String','');
set(handles.espacio2,'String','');
set(axes(handles.axes1,'String',''));
set(axes(handles.axes2,'String',''));
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
hr=str2double(get(handles.edificio1,'String'));
hb=str2double(get(handles.base1,'String'));
hm=str2double(get(handles.movil,'String'));
 d=str2double(get(handles.distancia1,'String'));
b=str2double(get(handles.separacion1,'String'));
fi=str2double(get(handles.angulo1,'String'));
f=str2double(get(handles.frecuencia1,'String'));
% perdida con linea de vista
Los=42.6+26*log10(d)+20*log10(f);
set(handles.vista1,'String',Los);
set(handles.vista2,'String',Los);
%Sin línea de vista
L0=32.5+20*log10(d)+20*log10(f);
vhr=hr-hm;
if(fi>=0)&&(fi<35)
 Lori=-10+0.3571*fi;
elseif(fi>=35)&&(fi<55)
 Lori=2.5+0.075*(fi-35);
elseif(fi>=55)&&(fi<90)
 Lori=4-0.114*(fi-55);
end
w=b/2;
set(handles.text138,'String',w);
Lrts=-16.9-10*log10(w)+10*log10(f)+20*log10(vhr)+Lori;
if Lrts<=0
 Lrts=0;
end
%Pérdidas multipantalla
vhb=hb-hr;
Lbsh=-18*log10(1+vhb);
if(vhb< 0)
 Lbsh=0;
end
%ka
if(vhb>=0)
 ka=54;
elseif(vhb<0)&&(d>=0.5)
 ka=54-(0.8*vhb);
elseif(vhb<0)&&(d<0.5)
 ka=54-(1.6*vhb*d);
end
%kd
if(vhb>=0)
 kd=18;
elseif(vhb<0)
 kd=18-15*(vhb/hr);
end
kf=-4+(0.7*((f/925)-1));
Lmsd=Lbsh+ka+kd*log10(d)+kf*log10(f)-9*log10(b);
Lb=L0+Lrts+Lmsd;
kf1=-4+(1.5*((f/925)-1));
Lmsd1=Lbsh+ka+kd*log10(d)+kf1*log10(f)-9*log10(b);
Lb1=L0+Lrts+Lmsd1;
%Resultados
set(handles.multipantalla1,'String',Lmsd);
set(handles.atenuacion1,'String',Lb);
set(handles.multipantalla2,'String',Lmsd1);
set(handles.atenuacion2,'String',Lb1);
set(handles.difraccion1,'String',Lrts);
set(handles.espacio1,'String',L0);
set(handles.difraccion2,'String',Lrts);
set(handles.espacio2,'String',L0);
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graficar1.
function graficar1_Callback(hObject, eventdata, handles)
hr=str2double(get(handles.edificio1,'String'));
hb=str2double(get(handles.base1,'String'));
hm=str2double(get(handles.movil1,'String'));
d=str2double(get(handles.distancia1,'String'));
b=str2double(get(handles.separacion1,'String'));
fi=str2double(get(handles.angulo1,'String'));
f=str2double(get(handles.frecuencia1,'String'));
d1=0:0.01:d;
Los=42.6+26*log10(d1)+20*log10(f);
L0=32.5+20*log10(d1)+20*log10(f);
vhr=hr-hm;
if(fi>=0)&&(fi<35)
 Lori=-10+0.3571*fi;
elseif(fi>=35)&&(fi<55)
 Lori=2.5+0.075*(fi-35);
elseif(fi>=55)&&(fi<90)
 Lori=4-0.114*(fi-55);
end
w=b/2;
Lrts=-16.9-10*log10(w)+10*log10(f)+20*log10(vhr)+Lori;
if Lrts<=0
 Lrts=0;
end
%Pérdidas multipantalla
vhb=hb-hr;
Lbsh=-18*log10(1+vhb);
if(vhb<0)
 Lbsh=0;
end
%ka
if(vhb>=0)
 ka=54;
elseif(vhb<0)&&(d>=0.5)
 ka=54-(0.8*vhb);
elseif(vhb<0)&&(d<0.5)
 ka=54-(1.6*vhb*d);
end
%kd
 if(vhb>=0)
 kd=18;
 elseif(vhb<0)
 kd=18-15*(vhb/hr);
end
kf=-4+(0.7*((f/925)-1));
Lmsd=Lbsh+ka+kd*log10(d1)+kf*log10(f)-9*log10(b);
Lb=L0+Lrts+Lmsd;
kf1=-4+(1.5*((f/925)-1));
Lmsd1=Lbsh+ka+kd*log10(d1)+kf1*log10(f)-9*log10(b);
Lb1=L0+Lrts+Lmsd1;
axes(handles.axes1);
plot(d1,Los,d1,Lb,d1,Lb1);
grid off;
xlabel('Distancia [km]');
ylabel('Pérdidas [dB]');
title('Pérdidas vs. Distancia');
legend('LOS C.G. y C.M.','NLOS C.G.','NLOS C.M');
% hObject    handle to graficar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graficar2.
function graficar2_Callback(hObject, eventdata, handles)
hr=str2double(get(handles.edificio1,'String'));
hb=str2double(get(handles.base1,'String'));
hm=str2double(get(handles.movil1,'String'));
d=str2double(get(handles.distancia1,'String'));
b=str2double(get(handles.separacion1,'String'));
fi=str2double(get(handles.angulo1,'String'));
f=str2double(get(handles.frecuencia1,'String'));
d1=0:0.1:800;
Los=42.6+26*log10(d1)+20*log10(f);
L0=32.5+20*log10(d1)+20*log10(f);
vhr=hr-hm;
if(fi>=0)&&(fi<35)
 Lori=-10+0.3571*fi;
elseif(fi>=35)&&(fi<55)
 Lori=2.5+0.075*(fi-35);
elseif(fi>=55)&&(fi<90)
 Lori=4-0.114*(fi-55);
end
w=b/2;
Lrts=-16.9-10*log10(w)+10*log10(f)+20*log10(vhr)+Lori;
if Lrts<=0
 Lrts=0;
end
%Pérdidas multipantalla
vhb=hb-hr;
Lbsh=-18*log10(1+vhb);
if(vhb<0)
 Lbsh=0;
end
%ka
if(vhb>=0)
 ka=54;
elseif(vhb<0)&&(d>=0.5)
 ka=54-(0.8*vhb);
elseif (vhb<0)&&(d<0.5)
 ka=54-(1.6*vhb*d);
end
%kd
 if(vhb>=0)
 kd=18;
 elseif(vhb<0)
 kd=18-15*(vhb/hr);
end
kf=-4+(0.7*((f/925)-1));
Lmsd=Lbsh+ka+kd*log10(d1)+kf*log10(f)-9*log10(b);
Lb=L0+Lrts+Lmsd;
kf1=-4+(1.5*((f/925)-1));
Lmsd1=Lbsh+ka+kd*log10(d1)+kf1*log10(f)-9*log10(b);
Lb1=L0+Lrts+Lmsd1;
axes(handles.axes2);
plot(d1,Los,d1,Lb,d1,Lb1);
grid off;
xlabel('Frecuencia [MHz]');
ylabel('Pérdidas [dB]');
title('Pérdidas vs. Frecuencia');
legend('LOS C.G. y C.M.','NLOS C.G.','NLOS C.M');
% hObject    handle to graficar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edificio1_Callback(hObject, eventdata, handles)
% hObject    handle to edificio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edificio1 as text
%        str2double(get(hObject,'String')) returns contents of edificio1 as a double


% --- Executes during object creation, after setting all properties.
function edificio1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edificio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function movil1_Callback(hObject, eventdata, handles)
% hObject    handle to movil1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of movil1 as text
%        str2double(get(hObject,'String')) returns contents of movil1 as a double


% --- Executes during object creation, after setting all properties.
function movil1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to movil1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function base1_Callback(hObject, eventdata, handles)
% hObject    handle to base1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of base1 as text
%        str2double(get(hObject,'String')) returns contents of base1 as a double


% --- Executes during object creation, after setting all properties.
function base1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to base1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text138_Callback(hObject, eventdata, handles)
% hObject    handle to text138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text138 as text
%        str2double(get(hObject,'String')) returns contents of text138 as a double


% --- Executes during object creation, after setting all properties.
function text138_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distancia1_Callback(hObject, eventdata, handles)
% hObject    handle to distancia1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distancia1 as text
%        str2double(get(hObject,'String')) returns contents of distancia1 as a double


% --- Executes during object creation, after setting all properties.
function distancia1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distancia1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function separacion1_Callback(hObject, eventdata, handles)
% hObject    handle to separacion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of separacion1 as text
%        str2double(get(hObject,'String')) returns contents of separacion1 as a double


% --- Executes during object creation, after setting all properties.
function separacion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to separacion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angulo1_Callback(hObject, eventdata, handles)
% hObject    handle to angulo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angulo1 as text
%        str2double(get(hObject,'String')) returns contents of angulo1 as a double


% --- Executes during object creation, after setting all properties.
function angulo1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angulo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frecuencia1_Callback(hObject, eventdata, handles)
% hObject    handle to frecuencia1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frecuencia1 as text
%        str2double(get(hObject,'String')) returns contents of frecuencia1 as a double


% --- Executes during object creation, after setting all properties.
function frecuencia1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frecuencia1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function atenuacion1_Callback(hObject, eventdata, handles)
% hObject    handle to atenuacion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of atenuacion1 as text
%        str2double(get(hObject,'String')) returns contents of atenuacion1 as a double


% --- Executes during object creation, after setting all properties.
function atenuacion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to atenuacion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function espacio1_Callback(hObject, eventdata, handles)
% hObject    handle to espacio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of espacio1 as text
%        str2double(get(hObject,'String')) returns contents of espacio1 as a double


% --- Executes during object creation, after setting all properties.
function espacio1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to espacio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function difraccion1_Callback(hObject, eventdata, handles)
% hObject    handle to difraccion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of difraccion1 as text
%        str2double(get(hObject,'String')) returns contents of difraccion1 as a double


% --- Executes during object creation, after setting all properties.
function difraccion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to difraccion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function multipantalla1_Callback(hObject, eventdata, handles)
% hObject    handle to multipantalla1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of multipantalla1 as text
%        str2double(get(hObject,'String')) returns contents of multipantalla1 as a double


% --- Executes during object creation, after setting all properties.
function multipantalla1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multipantalla1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
