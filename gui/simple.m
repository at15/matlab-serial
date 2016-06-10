function varargout = simple(varargin)
% SIMPLE MATLAB code for simple.fig
%      SIMPLE, by itself, creates a new SIMPLE or raises the existing
%      singleton*.
%
%      H = SIMPLE returns the handle to a new SIMPLE or the handle to
%      the existing singleton*.
%
%      SIMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE.M with the given input arguments.
%
%      SIMPLE('Property','Value',...) creates a new SIMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simple

% Last Modified by GUIDE v2.5 10-Jun-2016 15:42:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @simple_OpeningFcn, ...
    'gui_OutputFcn',  @simple_OutputFcn, ...
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


% --- Executes just before simple is made visible.
function simple_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple (see VARARGIN)

% Choose default command line output for simple
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simple wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simple_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    fclose(handles.serial);
    disp('serial closed');
catch ex
    disp(ex.message);
end

% --- Executes on button press in btn_open.
function btn_open_Callback(hObject, eventdata, handles)
% hObject    handle to btn_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = serial('COM3');
% s = serial('COM4');
s.OutputBufferSize = 5120000;
s.InputBufferSize = 5120000;
s.BaudRate = 115200;
s.BytesAvailableFcnMode = 'terminator';
s.Timeout = 20;
% get(s);
try
    fopen(s);
    handles.serial = s;
    disp('serial opened');
catch ex
    % disp(ex);
    disp(ex.message);
end
guidata(hObject,handles);

% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    fclose(handles.serial);
    disp('serial closed');
catch ex
    disp(ex.message);
end


% --- Executes on button press in btn_read.
function btn_read_Callback(hObject, eventdata, handles)
% hObject    handle to btn_read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    s = handles.serial;
    out = fscanf(s);
    disp(out);
catch ex
    disp(ex.message);
end


% --- Executes on button press in btn_write.
function btn_write_Callback(hObject, eventdata, handles)
% hObject    handle to btn_write (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    s = handles.serial;
    data = handles.dataToSend;
    fprintf(s, data);
    % fprintf(s, '%s\n', data, 'async');
catch ex
    disp(ex.message);
end

% --- Executes on button press in btn_read_file.
function btn_read_file_Callback(hObject, eventdata, handles)
% hObject    handle to btn_read_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    str = fileread('data.txt');
    disp(str);
    handles.dataToSend = str;
catch ex
    disp(ex.message);
end
guidata(hObject,handles);


