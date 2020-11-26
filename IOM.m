function varargout = IOM(varargin)
% IOM MATLAB code for IOM.fig
%      IOM, by itself, creates a new IOM or raises the existing
%      singleton*.
%
%      H = IOM returns the handle to a new IOM or the handle to
%      the existing singleton*.
%
%      IOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IOM.M with the given input arguments.
%
%      IOM('Property','Value',...) creates a new IOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IOM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IOM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IOM

% Last Modified by GUIDE v2.5 23-May-2020 15:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IOM_OpeningFcn, ...
                   'gui_OutputFcn',  @IOM_OutputFcn, ...
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


% --- Executes just before IOM is made visible.
function IOM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IOM (see VARARGIN)

% Choose default command line output for IOM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IOM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IOM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_import.
function button_import_Callback(hObject, eventdata, handles)
% hObject    handle to button_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image I_ref
[name,dir,index] = uigetfile({'*.jpg';'*.JPG';'*.png';'*.PNG'},'choose an image','.\RGB');
if index == 1
    str=[dir name];
    image=imread(str);
    set(handles.OriginalImage,'visible','on');
    axes(handles.OriginalImage);
    imshow(image);
    strr=strrep(str,'g.jpg','r.tif');
    I_ref=imread(strr);
    I_ref=im2bw(I_ref(:,:,1),0.5);
    I_ref=~I_ref;
    image=imnoise(image,'speckle',0.05);
    set(handles.ImageWithNoise,'visible','on');
    axes(handles.ImageWithNoise);
    imshow(image);
else
   errordlg('错误','Error');
end

set(handles.chooseway,'visible','on');






% --- Executes on selection change in chooseShrink.
function chooseShrink_Callback(hObject, eventdata, handles)
% hObject    handle to chooseShrink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chooseShrink contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chooseShrink


% --- Executes during object creation, after setting all properties.
function chooseShrink_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chooseShrink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% --- Executes on selection change in chooseLable.
function chooseLable_Callback(hObject, eventdata, handles)
% hObject    handle to chooseLable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chooseLable contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chooseLable


% --- Executes during object creation, after setting all properties.
function chooseLable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chooseLable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function ICMtimes_Callback(hObject, eventdata, handles)
% hObject    handle to ICMtimes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ICMtimes as text
%        str2double(get(hObject,'String')) returns contents of ICMtimes as a double


% --- Executes during object creation, after setting all properties.
function ICMtimes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ICMtimes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ICMbeta_Callback(hObject, eventdata, handles)
% hObject    handle to ICMbeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ICMbeta as text
%        str2double(get(hObject,'String')) returns contents of ICMbeta as a double


% --- Executes during object creation, after setting all properties.
function ICMbeta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ICMbeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartSeg.
function StartSeg_Callback(hObject, eventdata, handles)
% hObject    handle to StartSeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image I_ref

tic;
wavename='sym4';
[cA,~,~,~]=dwt2(image,wavename);

shrinkMode=get(handles.chooseShrink,'value');       %小波域降噪
switch shrinkMode
    case 1                                          %不降噪
        I_d=double(image);
    case 2                                          %Visu阈值降噪
        I_d=visushrink(image);
    case 3                                          %Sure阈值降噪
        [C,S]=wavedec2(image,3,wavename);
        alp=1.5;m=1.7*prod(S(1,:));
        [thr,~]=wdcbm2(C,S,alp,m);
        [I_d,~,~,~,~]=wdencmp('lvd',C,S,wavename,3,thr,'h');
    case 4
        I_d=bayesshrink(image,wavename);
end
set(handles.lableandgray,'visible','on');
set(handles.GrayField,'visible','on');
axes(handles.GrayField);
imshow(uint8(I_d));

%建立标号场
segMode=get(handles.chooseLable,'value');
switch segMode
    case 1
        level=graythresh(uint8(cA));
        lable=im2bw(uint8(cA),level);
        lable=imresize(lable-1,size(image),'nearest')+1;
    case 2
        lable=otsu2d(uint8(cA));
    case 3
        wh=waitbar(0.01,'使用CV模型分割中','name','CV分割');
        lable=cv(uint8(cA),350,wh);
        lable=im2bw(lable,0.5);
        close(wh);
    case 4
        lable=kmean(uint8(cA),2);
        lable=lable-1;
end
lable=imresize(lable-1,size(image),'nearest')+1;
set(handles.LableField,'visible','on');
axes(handles.LableField);
imshow(255*uint8(lable));

%ICM
whi=waitbar(0.01,'ICM','name','ICM运算');
beta=str2num(get(handles.ICMbeta ,'string'));
time=str2num(get(handles.ICMtimes,'string'));
Iseg=mipicm2d2r(I_d,lable+1,beta,time,whi)-1;
set(handles.result_area,'visible','on');
close(whi);
axes(handles.MRF_result);
imshow(255*uint8(Iseg));

%计算分割效果
%I_ref=~I_ref;
Iseg=~Iseg;

A=(sum(sum(Iseg & I_ref)))/(sum(sum(I_ref)))*100;
E=(abs(sum(sum(Iseg))-sum(sum(I_ref & Iseg))))/(sum(sum(I_ref)))*100;
time=toc;

A=roundn(A,-2);
E=roundn(E,-2);
time=roundn(time,-2);

set(handles.AR_result,'string',[num2str(A) '%']);
set(handles.ER_result,'string',[num2str(E) '%']);
% set(handles.AR_result,'string','87.19%');
% set(handles.ER_result,'string','10.34%');
set(handles.usetime,  'string',[num2str(time) 's']);


%disp(['Accept rate=' num2str(A) '%']);
%disp(['Error rate =' num2str(E) '%']);


























% --- Executes during object creation, after setting all properties.
function result_area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function OriginalImage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OriginalImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate OriginalImage
