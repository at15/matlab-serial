function varargout = seriesComm(varargin)
% SERIESCOMM M-file for seriesComm.fig
%      SERIESCOMM, by itself, creates a new SERIESCOMM or raises the existing
%      singleton*.
%
%      H = SERIESCOMM returns the handle to a new SERIESCOMM or the handle to
%      the existing singleton*.
%
%      SERIESCOMM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIESCOMM.M with the given input arguments.
%
%      SERIESCOMM('Property','Value',...) creates a new SERIESCOMM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before seriesComm_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to seriesComm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help seriesComm

% Last Modified by GUIDE v2.5 16-Nov-2005 22:07:39

% Begin initialization code - DO NOT EDIT

%%Author: spirit3772,THUEE,NIP LAB,lks04@mails.tsinghua.edu.cn
%%Date: 2005/11/16,23:00
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @seriesComm_OpeningFcn, ...
                   'gui_OutputFcn',  @seriesComm_OutputFcn, ...
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


% --- Executes just before seriesComm is made visible.
function seriesComm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to seriesComm (see VARARGIN)

% Choose default command line output for seriesComm
handles.output = hObject;

%设置初始化参数
set(handles.text3,'string','');
set(handles.text4,'string','');
set(handles.pushbutton4,'enable','off');
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton6,'enable','off');
set(handles.pushbutton1,'String','Open Serial Port','foreGroundColor',[1,0,0.5]);
set(handles.checkbox1,'Value',0);
set(handles.checkbox2,'Value',0);
%设置handles中的一些变量，便于全局共享
handles.displayT = 0;%表征串口是否打开
handles.hasData = 1;%表征串口是否接收到数据
handles.isShow = 1;%表征是否正在进行数据显示，即是否正在执行函数dataDisp
handles.strRec = '';
handles.baud_rate = 600;
handles.com = 'COM1';
handles.verifiedBits = 'NONE';
handles.dataBits = 8;
handles.stopBit = 1;
handles.flowControl = 'NONE';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes seriesComm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = seriesComm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)%发送框
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%清发送数据
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','');


function edit2_Callback(hObject, eventdata, handles)%接受框
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%清接受数据
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'string','');
handles.strRec = '';
guidata(hObject,handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)%以下是6个发送参数
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
com = get(hObject,'string');
handles.com = com{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
baud_rate = get(hObject,'string');
handles.baud_rate = str2num(baud_rate{get(hObject,'Value')});
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
verifiedBits = get(hObject,'string');
handles.verifiedBits = verifiedBits{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
dataBits = get(hObject,'string');
handles.dataBits = str2num(dataBits{get(hObject,'Value')});
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
stopBit = get(hObject,'string');
handles.stopBit = str2num(stopBit{get(hObject,'Value')});
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
 
flowControl = get(hObject,'string');
handles.flowControl = flowControl{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%打开串口按钮的回调程序
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%创建串口对象
%scom = serial(com);
%首先检验是打开串口操作还是关闭操作

%打开操作
if(strcmp(get(hObject,'string') , 'Open Serial Port'))
    %建立一个serial object，并设置其参数（接收的终止符号为\n）
     try
        handles.serial =  serial(handles.com,'BaudRate',handles.baud_rate,'DataBits',handles.dataBits,...
                                'Parity',handles.verifiedBits,'StopBits',handles.stopBit,'FlowControl',...
                                handles.flowControl,'terminator',char(13),'BytesAvailableFcnCount', 10,...
                                'BytesAvailableFcn', {@bytes, handles},'TimerPeriod', 0.05, 'timerfcn', {@dataDisp, handles});
        set(handles.serial,'OutputBufferSize',512000);
        set(handles.serial,'InputBufferSize',512000);
        handles.serial.BytesAvailableFcnMode = 'terminator';
        % 将串口对象的句柄作为用户数据，存入窗口对象
        %set(handles.figure1, 'UserData', scom);
        %当接受到数据后如果碰到结束符\n就读入，调用receiveData函数
        %handles.serial.BytesAvailableFcn={'receiveData',handles};
        guidata(hObject,handles);
        %打开串口

        fopen(handles.serial);
        set(hObject,'String','Close Serial Port','foreGroundColor',[67/255,64/255,119/255]);
        str = ['Serial Port ', handles.com , ' opened sucessfully!'];
        set(handles.text3,'String',str,'fontweight','bold');
        set(handles.pushbutton4,'enable','on');
        set(handles.pushbutton5,'enable','on');
        set(handles.pushbutton6,'enable','on');
     catch
        %进行出错处理
        errmsg = lasterr;
        errordlg([errmsg,char(10),'   Can''t Open Serial Port : ',handles.com, char(10),'   Please choose another Port!'],'Serial Port Open Error');
        rethrow(lasterror);
    end
%关闭串口操作
else
   
    fclose(handles.serial);
    set(hObject,'String','Open Serial Port','foreGroundColor',[1,0,0.5]);
    str = ['Serial Port ', handles.com , ' closed sucessfully!'];
    set(handles.text3,'String',str,'fontweight','bold');
    set(handles.pushbutton4,'enable','off');
    set(handles.pushbutton5,'enable','off');
    set(handles.pushbutton6,'enable','off');
end
  
function dataDisp(hObject, eventdata, handles)
% disp('data disp');
%	串口的TimerFcn回调函数
%   串口数据显示
%% 获取参数
hasData = getappdata(handles.figure1, 'hasData'); %串口是否收到数据
strRec = getappdata(handles.figure1, 'strRec');   %串口数据的字符串形式，定时显示该数据
% disp('aaaa');
% hasData = 0;
%% 若串口没有接收到数据，先尝试接收串口数据
if ~hasData
    bytes(hObject, eventdata, handles);
end
%% 若串口有数据，显示串口数据
if hasData
    disp('has data!');
    %% 给数据显示模块加互斥锁
    %% 在执行显示数据模块时，不接受串口数据，即不执行BytesAvailableFcn回调函数
    setappdata(handles.figure1, 'isShow', true); 
%     %% 若要显示的字符串长度超过10000，清空显示区
%     if length(strRec) > 10000
%         strRec = '';
%         setappdata(handles.figure1, 'strRec', strRec);
%     end
    %% 显示数据
    set(handles.edit2, 'string', strRec);
    
    %% 更新hasData标志，表明串口数据已经显示
    setappdata(handles.figure1, 'hasData', false);
    %% 给数据显示模块解锁
    setappdata(handles.figure1, 'isShow', false);
end
 
function bytes(hObject, enentdata, handles)
disp('bytes available !');
%   串口的BytesAvailableFcn回调函数
%   串口接收数据
%% 获取参数
strRec = getappdata(handles.figure1, 'strRec'); %获取串口要显示的数据
isShow = getappdata(handles.figure1, 'isShow'); %是否正在执行显示数据操作
%% 若正在执行数据显示操作，暂不接收串口数据
% if isShow
%     return;
% end
%% 获取串口可获取的数据个数
n = get(hObject, 'BytesAvailable');

%% 若串口有数据，接收所有数据
if n
    %% 更新hasData参数，表明串口有数据需要显示
    setappdata(handles.figure1, 'hasData', true);
    %% 读取串口数据
    a = fread(hObject, n, 'uchar');
    % 若没有停止显示，将接收到的数据解算出来，准备显示
    %根据进制显示的状态，解析数据为要显示的字符串
        c = char(a');
       
       
       %% 更新要显示的字符串
        strRec = [strRec c];
end
    %% 更新参数
    setappdata(handles.figure1, 'strRec', strRec); %更新要显示的字符串



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%发送数据按钮回调程序
str = get(handles.edit1,'string');
%检测端口状态
if(strcmp(handles.serial.status,'closed'))
    str1 = ['Serial Port ', handles.com , ' is closed ,Please open it!'];
    set(handles.text3,'String',str1,'fontweight','bold');
else
    %打开时进行串口写出
    if(handles.displayT == 0)
        fprintf(handles.serial,'%s',str);
        str2 = ['Data has sent in ASCI format sucessfully!'];
        set(handles.text3,'String',str2,'fontweight','bold');
    else
        fprintf(handles.serial,'%x',str);
        str3 = ['Data has sent in HEX format sucessfully!'];
        set(handles.text3,'String',str3,'fontweight','bold');
    end
end




% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)%发送16进制呈现
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.displayT = get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%接收16进制呈现
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.displayR = get(hObject,'Value');
guidata(hObject,handles);




% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

%推出界面时 检查是否关闭串口
button = questdlg('Do you really want to quit? ','Quit?','Yes','No','No');
if(strcmp(button, 'Yes'))
        if(strcmp(get(handles.pushbutton1,'string'),'Close Serial Port'))
            fclose(handles.serial);
        end
    delete(hObject);
else
    return;
end




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%发送文件前选择文件
[filename, pathname] = uigetfile( ...
{'*.txt;*.c;*.cpp;*.m','TEXT Files (*.txt,*.c,*.cpp,*.m)';
   '*.txt',  'TEXT-files (*.txt)'; ...
   '*.c','C-Files (*.c)'; ...
   '*.cpp','C++-Files (*.cpp)'; ...
   '*.m','M-Files (*.m)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');
if isequal([filename,pathname],[0,0])
    return
% Otherwise construct the fullfilename and Check and load the file
else
    handles.filePath = fullfile(pathname,filename);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%发送文件 文件不能太大
fid = fopen(handles.filePath, 'r');
tempstr = ['File ',handles.filePath, ' has opened sucessfully!'];
set(handles.text4,'string',tempstr,'fontweight','bold');
str = fread(fid,'*char');
str = str';
set(handles.edit1,'string',str);

if(strcmp(handles.serial.status,'closed'))
    str1 = ['Serial Port ', handles.com , ' is closed ,Please open it!'];
    set(handles.text3,'String',str1,'fontweight','bold');
else
    if(handles.displayT == 0)
        fprintf(handles.serial,'%s',str);
        str2 = ['Data has sent in ASCI format sucessfully!'];
        set(handles.text3,'String',str2,'fontweight','bold');
    else
        fprintf(handles.serial,'%x',str);
        str3 = ['Data has sent in HEX format sucessfully!'];
        set(handles.text3,'String',str3,'fontweight','bold');
    end
end

