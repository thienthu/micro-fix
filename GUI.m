function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 02-May-2017 03:46:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

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



function severity_result_Callback(hObject, eventdata, handles)
% hObject    handle to severity_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of severity_result as text
%        str2double(get(hObject,'String')) returns contents of severity_result as a double


% --- Executes during object creation, after setting all properties.
function severity_result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to severity_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.startButton,'Value');
%% change to new folder
Fs1=100;
Ts1=1/Fs1;
Fs2=100;
Ts2=1/Fs2;
Fs3=100;
Ts3=1/Fs3;
x1=28; % Reach from fromat ofdats PEF, '1' is just the example
x2=28; % Reach from format of data SPo2, ''
x3=28; % reach from format of data HR, ''
if val==1
    cd ('D:\My Library\Project\Micro\Matlab\matlab\MIMIC II WAVEFORM DATABASE\ASTHMA DATA\s00033\s00033-2559-01-25-12-35');
    %%%%%%%% PEF data%%%%%%%%%%%%%%%%%
    b1=dir('s00033-2559-01-25-12-35_A*'); %% get the current data of spo2
    b1=b1(end-1); %%% change 1 into lb1
    a1=b1.name;
    n1=double(a1);
    con1=n1(1:x1);%% constant part
    change1=n1(x1+1:end);
   ind1=change1(find(change1>=48 & change1<=57));
   num1=char(ind1);
   num1=str2num(num1);
   PEF=load(a1);
   PEF=PEF.m_II;
   %%%%SPO2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   b2=dir('s00033-2559-01-25-12-35_A*'); %% get the current data of spo2
    b2=b2(end-1); %%% change 1 into lb2
    a2=b2.name;
    n2=double(a2);
    con2=n1(1:x2);%% constant part
    change2=n2(x2+1:end);
   ind2=change2(find(change2>=48 & change2<=57));
   num2=char(ind2);
   num2=str2num(num2);
   SPO2=load(a2);
   SPO2=SPO2.m_II; %% call cell of SPO2
   %%%%%%%%%%%%%%% HR data %%%%%%%%%%%%%%%%%
   b3=dir('s00033-2559-01-25-12-35_A*'); %% get the current data of spo2
    b3=b3(end-1); %%% change 1 into lb3
    a3=b3.name;
    n3=double(a3);
    con3=n3(1:x3);%% constant part
    change3=n3(x3+1:end);
   ind3=change3(find(change3>=48 & change3<=57));
   num3=char(ind3);
   num3=str2num(num3);
   HR=load(a3);
   HR=HR.m_II; %% call cell of HR
 %%%%% finish to get the current data of SPo2  
  l1=numel(PEF);   
  l2=numel(SPO2);
  l3=numel(HR);
  lt1=0;
  lt2=0;
  lt3=0;
    while l1~=0 && l2~=0 && l3~=0
    num=[num1,num2,num3];
    t1=Ts1*length(PEF);
    t2=Ts2*length(PEF);
    t3=Ts3*length(PEF);
    lt1=lt1+l1; %% chay thi bo cai nay
    lt2=lt2+l2; %% chay thi bo cai nay
    lt3=lt3+l3; %% chay thi bo cai nay
    axes(handles.PEF_plot);
    plot(1+lt1:l1+lt1,PEF); %% change in to 1:Fs:t
    axes(handles.SpO2_plot);
    plot(1+lt2:l2+lt2,SPO2); %% change in to 1:Fs:t
    axes(handles.HR_plot);
    plot(1+lt3:l3+lt3,HR); %% change in to 1:Fs:t
    for i= 1:l1
        data1=PEF(i);
        data2=SPO2(i);
        data3=HR(i);
    if data1==0 || data2==0 || data3==0 
        set(handles.Status,'String','Running');
        set(handles.YN_results,'String','');
        set(handles.severity_result,'String','');
    elseif data1>=33 && data1<=50 && data2 >92 && data3>110
        set(handles.Status,'String','data');
        set(handles.YN_results,'String','yes');
        set(handles.severity_result,'String','moderate asthma');
    elseif data1 <=33 && data2 <=92 && data3<60
        set(handles.Status,'String','data');
        set(handles.YN_results,'String','yes');
        set(handles.severity_result,'String','severe asthma');
    elseif data1 >=50 && data1<=75 && data2 >92 && data3<110
        set(handles.Status,'String','data');
        set(handles.YN_results,'String','yes');
        set(handles.severity_result,'String','mild asthma');
    else
        set(handles.Status,'String','data');
        set(handles.YN_results,'String','no');
        set(handles.severity_result,'String','normal');
    end
    end
    %%% import new data
     %%%%%load new data PEF%%%%%%%%%%%%%
     num1=num1+1;
     var1=num2str(num1);
     last1=[con1,var1,'.mat']; %% call the name of current txt file
     PEF=load(last1);
     PEF=PEF.m_II;
     l1=length(PEF);
     %%%%%%load new data SPO2 %%%%%
     num2=num2+1;
     var2=num2str(num2);
     last2=[con2,var2,'.mat']; %% call the name of current txt file
     SPO2=load(last2);
     SPO2=SPO2.m_II; %% call cell of SPO2
     l2=length(SPO2);
     %%%%%% load new data HR %%%%%%%
     num3=num3+1;
     var3=num2str(num3);
     last3=[con3,var3,'.mat']; %% call the name of current txt file
     HR=load(last3);
     HR=HR.m_II; %% call cell of HR
     l3=length(HR);
     lt1=lt1+l1; %% chay thi bo cai nay
    lt2=lt2+l2; %% chay thi bo cai nay
    lt3=lt3+l3; %% chay thi bo cai nay
    end  
else 
     set(handles.Status,'String','stop');
end
        
function Status_Callback(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Status as text
%        str2double(get(hObject,'String')) returns contents of Status as a double


% --- Executes during object creation, after setting all properties.
function Status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YN_results_Callback(hObject, eventdata, handles)
% hObject    handle to YN_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YN_results as text
%        str2double(get(hObject,'String')) returns contents of YN_results as a double


% --- Executes during object creation, after setting all properties.
function YN_results_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YN_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
