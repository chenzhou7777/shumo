function [TAG,ANCHOR1,ANCHOR2,s0,s1,s_test1,s_test2,s_test3,s_test4,s_test5,s2]=Read
%%读取题目所有的设定值
PATH = ['C:\Users\Chenzhou\Desktop\shumo\CODE\'];
%任务一给定的324个Tag位置坐标,TAG(:,:)
name = ['附件1：UWB数据集\Tag坐标信息.txt'];
file = fullfile(PATH,name);%文件名
fid = fopen(file);
lines= textscan(fid,'%f:%f %f %f %*[^\n]','Headerlines',2);%读取文件
TAG(:,:) = cell2mat(lines(:,2:4))*10;
fclose all;

%实验场景一下四个锚点（anchor）的坐标,ANCHOR1
ANCHOR1=[0,0,1300;
    5000,0,1700;
    0,5000,1700;
    5000,5000,1300];

%实验场景二下四个锚点（anchor）的坐标,ANCHOR2
ANCHOR2=[0,0,1200;
    5000,0,1600;
    0,3000,1600;
    5000,3000,1200];

%任务一给的正常情况测的324个份距离文件,s0
PATH0 = [PATH,'附件1：UWB数据集\正常数据\'];%路径
for i = 1:324
    name0 = [num2str(i),'.正常.txt'];
    file = fullfile(PATH0,name0);%文件名
    fid = fopen(file);%打开文件
    lines= textscan(fid,'%s %*[^\n]','Headerlines',1);%读取文件
    k1=size(lines{1,1},1);%数据长度
    A = lines{1,1};%字符串数据
    k2 = k1/4;%数据组数
    B(:,:) = Change(A,k2);%读取数据
    m = size(B,1);
    s0(i,1:m,:) = B(:,:);
    clear lines A B;
    fclose all;
end

%任务一给的异常情况测的324个份距离文件,s1
PATH1 = [PATH,'附件1：UWB数据集\异常数据\'];%路径
for i = 1:324
    name1 = [num2str(i),'.异常.txt'];
    file = fullfile(PATH1,name1);%文件名
    fid = fopen(file);%打开文件
    lines= textscan(fid,'%s %*[^\n]','Headerlines',1);%读取文件
    k1=size(lines{1,1},1);%数据长度
    A = lines{1,1};%字符串数据
    k2 = k1/4;%数据组数
    B(:,:) = Change(A,k2);%读取数据
    m = size(B,1);
    s1(i,1:m,:) = B(:,:);
    clear lines A B;
    fclose all;
end

%任务二给的5组无信号干扰测量距离，s_test1
s_test1 = [1320 3950 4540 5760;
    3580 2580 4610 3730;
    2930 2600 4740 4420;
    2740 2720 4670 4790;
    2980 4310 2820 4320];

%任务二给的5组有信号干扰测量距离，s_test2
s_test2 = [2230 3230 4910 5180;
    4520 1990 5600 3360;
    2480 3530 4180 5070;
    4220 2510 4670 3490;
    5150 2120 5800 2770];

%任务三给的5组无信号干扰测量距离，s_test3
s_test3 = [4220 2580 3730 1450;
    4500 1940 4420 1460;
    3550 2510 3410 2140;
    3300 3130 2900 2790;
    720 4520 3050 5380];

%任务三给的5组无信号干扰测量距离，s_test4
s_test4 = [5100 2220 4970 800;
    2900 3210 3140 2890;
    2380 3530 2320 3760;
    2150 3220 3140 3640;
    1620 3950 2580 4440];

%任务四给的10组测量距离，s_test5
s_test5 = [2940 4290 2840 4190;
    5240 5360 2040 2940;
    4800 2610 4750 2550;
    5010 4120 3810 2020;
    2840 4490 2860 4190;
    5010 5320 1990 2930;
    5050 3740 3710 2070;
    5050 4110 3710 2110;
    4840 2600 4960 2700;
    2740 2720 4670 4790];

%任务五给的动态轨迹测量数据,s2
name2 = ['附件5：动态轨迹数据.txt'];
file = fullfile(PATH,name2);%文件名
fid = fopen(file);%打开文件
lines= textscan(fid,'%s %*[^\n]','Headerlines',1);%读取文件
k1=size(lines{1,1},1);%数据长度
A = lines{1,1};%字符串数据
k2 = k1/4;%数据组数
s2(:,:) = Change(A,k2);%读取数据
fclose all;
