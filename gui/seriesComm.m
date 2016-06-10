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

%���ó�ʼ������
set(handles.text3,'string','');
set(handles.text4,'string','');
set(handles.pushbutton4,'enable','off');
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton6,'enable','off');
set(handles.pushbutton1,'String','Open Serial Port','foreGroundColor',[1,0,0.5]);
set(handles.checkbox1,'Value',0);
set(handles.checkbox2,'Value',0);
%����handles�е�һЩ����������ȫ�ֹ���
handles.displayT = 0;%���������Ƿ��
handles.hasData = 1;%���������Ƿ���յ�����
handles.isShow = 1;%�����Ƿ����ڽ���������ʾ�����Ƿ�����ִ�к���dataDisp
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



function edit1_Callback(hObject, eventdata, handles)%���Ϳ�
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
function pushbutton2_Callback(hObject, eventdata, handles)%�巢������
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','');


function edit2_Callback(hObject, eventdata, handles)%���ܿ�
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
function pushbutton3_Callback(hObject, eventdata, handles)%���������
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'string','');
handles.strRec = '';
guidata(hObject,handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)%������6�����Ͳ���
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
function pushbutton1_Callback(hObject, eventdata, handles)%�򿪴��ڰ�ť�Ļص�����
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%�������ڶ���
%scom = serial(com);
%���ȼ����Ǵ򿪴��ڲ������ǹرղ���

%�򿪲���
if(strcmp(get(hObject,'string') , 'Open Serial Port'))
    %����һ��serial object������������������յ���ֹ����Ϊ\n��
     try
        handles.serial =  serial(handles.com,'BaudRate',handles.baud_rate,'DataBits',handles.dataBits,...
                                'Parity',handles.verifiedBits,'StopBits',handles.stopBit,'FlowControl',...
                                handles.flowControl,'terminator',char(13),'BytesAvailableFcnCount', 10,...
                                'BytesAvailableFcn', {@bytes, handles},'TimerPeriod', 0.05, 'timerfcn', {@dataDisp, handles});
        set(handles.serial,'OutputBufferSize',512000);
        set(handles.serial,'InputBufferSize',512000);
        handles.serial.BytesAvailableFcnMode = 'terminator';
        % �����ڶ���ľ����Ϊ�û����ݣ����봰�ڶ���
        %set(handles.figure1, 'UserData', scom);
        %�����ܵ����ݺ��������������\n�Ͷ��룬����receiveData����
        %handles.serial.BytesAvailableFcn={'receiveData',handles};
        guidata(hObject,handles);
        %�򿪴���

        fopen(handles.serial);
        set(hObject,'String','Close Serial Port','foreGroundColor',[67/255,64/255,119/255]);
        str = ['Serial Port ', handles.com , ' opened sucessfully!'];
        set(handles.text3,'String',str,'fontweight','bold');
        set(handles.pushbutton4,'enable','on');
        set(handles.pushbutton5,'enable','on');
        set(handles.pushbutton6,'enable','on');
     catch
        %���г�����
        errmsg = lasterr;
        errordlg([errmsg,char(10),'   Can''t Open Serial Port : ',handles.com, char(10),'   Please choose another Port!'],'Serial Port Open Error');
        rethrow(lasterror);
    end
%�رմ��ڲ���
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
%	���ڵ�TimerFcn�ص�����
%   ����������ʾ
%% ��ȡ����
hasData = getappdata(handles.figure1, 'hasData'); %�����Ƿ��յ�����
strRec = getappdata(handles.figure1, 'strRec');   %�������ݵ��ַ�����ʽ����ʱ��ʾ������
% disp('aaaa');
% hasData = 0;
%% ������û�н��յ����ݣ��ȳ��Խ��մ�������
if ~hasData
    bytes(hObject, eventdata, handles);
end
%% �����������ݣ���ʾ��������
if hasData
    disp('has data!');
    %% ��������ʾģ��ӻ�����
    %% ��ִ����ʾ����ģ��ʱ�������ܴ������ݣ�����ִ��BytesAvailableFcn�ص�����
    setappdata(handles.figure1, 'isShow', true); 
%     %% ��Ҫ��ʾ���ַ������ȳ���10000�������ʾ��
%     if length(strRec) > 10000
%         strRec = '';
%         setappdata(handles.figure1, 'strRec', strRec);
%     end
    %% ��ʾ����
    set(handles.edit2, 'string', strRec);
    
    %% ����hasData��־���������������Ѿ���ʾ
    setappdata(handles.figure1, 'hasData', false);
    %% ��������ʾģ�����
    setappdata(handles.figure1, 'isShow', false);
end
 
function bytes(hObject, enentdata, handles)
disp('bytes available !');
%   ���ڵ�BytesAvailableFcn�ص�����
%   ���ڽ�������
%% ��ȡ����
strRec = getappdata(handles.figure1, 'strRec'); %��ȡ����Ҫ��ʾ������
isShow = getappdata(handles.figure1, 'isShow'); %�Ƿ�����ִ����ʾ���ݲ���
%% ������ִ��������ʾ�������ݲ����մ�������
% if isShow
%     return;
% end
%% ��ȡ���ڿɻ�ȡ�����ݸ���
n = get(hObject, 'BytesAvailable');

%% �����������ݣ�������������
if n
    %% ����hasData����������������������Ҫ��ʾ
    setappdata(handles.figure1, 'hasData', true);
    %% ��ȡ��������
    a = fread(hObject, n, 'uchar');
    % ��û��ֹͣ��ʾ�������յ������ݽ��������׼����ʾ
    %���ݽ�����ʾ��״̬����������ΪҪ��ʾ���ַ���
        c = char(a');
       
       
       %% ����Ҫ��ʾ���ַ���
        strRec = [strRec c];
end
    %% ���²���
    setappdata(handles.figure1, 'strRec', strRec); %����Ҫ��ʾ���ַ���



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�������ݰ�ť�ص�����
str = get(handles.edit1,'string');
%���˿�״̬
if(strcmp(handles.serial.status,'closed'))
    str1 = ['Serial Port ', handles.com , ' is closed ,Please open it!'];
    set(handles.text3,'String',str1,'fontweight','bold');
else
    %��ʱ���д���д��
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
function checkbox1_Callback(hObject, eventdata, handles)%����16���Ƴ���
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.displayT = get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%����16���Ƴ���
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

%�Ƴ�����ʱ ����Ƿ�رմ���
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

%�����ļ�ǰѡ���ļ�
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

%�����ļ� �ļ�����̫��
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

