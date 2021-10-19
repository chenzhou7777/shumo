clc
clear all

%%
%%读取题目所有的设定值
[TAG,ANCHOR1,ANCHOR2,s0,s1,s_test1,s_test2,s_test3,s_test4,s_test5,s2] = Read;

%%
%%任务一：数据预处理
%绘制实验场景一
figure
scatter3(ANCHOR1(:,1),ANCHOR1(:,2),ANCHOR1(:,3),100,'filled');
xlim([0 5000]);%横轴边界
ylim([0 5000]);%纵轴边界
zlim([0 5000]);%竖轴边界
hold on
scatter3(2500,2500,2500,100,'pentagram');

d0 = Del(s0);
d1 = Del(s1);%删除异常数据
%通过聚类后去众数去除相同值和相似值，然后输出txt文件
for t=1:324
    k0 = size(d0(t,:,:),2);
    k1 = size(d1(t,:,:),2);
    m = 1;
    n = 1;
    for k = 1:k0
        if d0(t,k,1)~=0
            X0(m,:)=d0(t,k,:);
            m=m+1;
        end
    end
    for k = 1:k1
        if d1(t,k,1)~=0
            X1(n,:)=d1(t,k,:);
            n=n+1;
        end
    end
    XX0=mapminmax(X0',0,1)';%对四维距离数据进行归一化处理
    XX1=mapminmax(X1',0,1)';
    T0=kmeans(XX0,3); % 用k均值方法聚类，kmeans(X,3)表示生成3类
    T1=kmeans(XX1,6); % 用k均值方法聚类，kmeans(X,6)表示生成6类
    Y0(t,:,:) = Mode0(X0,T0); %对3类数据每类取众数
    Y1(t,:,:) = Mode1(X1,T1); %对6类数据每类取众数
%     Write0(t,Y0(t,:,:));%将正常情况数据Y0输出
%     Write1(t,Y1(t,:,:));%将异常情况数据Y1输出
    clear X0 X1 T0 T1
end

%%
%%任务二：定位模型
%基于任务一处理后的正常数据Y0进行Tag定位
for t = 1:324
    Y0(t,1,:) = min(Y0(t,:,:));
    TAG0(t,:) = Calculate(ANCHOR1,Y0(t,1,:));
end
%正常情况下计算位置与真实位置的相关性
[RX_0,PX_0]=corrcoef(TAG(:,1),TAG0(:,1));
[RY_0,PY_0]=corrcoef(TAG(:,2),TAG0(:,2));
[RZ_0,PZ_0]=corrcoef(TAG(:,3),TAG0(:,3));
[RXY_0,PXY_0]=corrcoef(sqrt((TAG(:,1)).^2+(TAG(:,2)).^2),sqrt(TAG0(:,1).^2+TAG0(:,2).^2));
[RXYZ_0,PXYZ_0]=corrcoef(sqrt((TAG(:,1)).^2+(TAG(:,2)).^2+(TAG(:,3)).^2),sqrt(TAG0(:,1).^2+TAG0(:,2).^2+TAG0(:,3).^2));
%正常情况下计算位置与真实位置的绝对误差平均值（mm）
error_X0 = mean(abs(TAG(:,1)-TAG0(:,1)));
error_Y0 = mean(abs(TAG(:,2)-TAG0(:,2)));
error_Z0 = mean(abs(TAG(:,3)-TAG0(:,3)));
error_XY0 = mean(abs(sqrt((TAG(:,1)-TAG0(:,1)).^2+(TAG(:,2)-TAG0(:,2)).^2)));
error_XYZ0 = mean(abs(sqrt((TAG(:,1)-TAG0(:,1)).^2+(TAG(:,2)-TAG0(:,2)).^2)+(TAG(:,3)-TAG0(:,3)).^2));
%正常情况下计算位置与真实位置的相对误差平均值（%）
ERROR_X0 = mean(abs(TAG(:,1)-TAG0(:,1))./TAG(:,1));
ERROR_Y0 = mean(abs(TAG(:,2)-TAG0(:,2))./TAG(:,2));
ERROR_Z0 = mean(abs(TAG(:,3)-TAG0(:,3))./TAG(:,3));
ERROR_XY0 = mean(abs(sqrt((TAG(:,1)-TAG0(:,1)).^2+(TAG(:,2)-TAG0(:,2)).^2))./sqrt(TAG(:,1).^2+TAG(:,2).^2));
ERROR_XYZ0 = mean(abs(sqrt((TAG(:,1)-TAG0(:,1)).^2+(TAG(:,2)-TAG0(:,2)).^2)+(TAG(:,3)-TAG0(:,3)).^2)./sqrt(TAG(:,1).^2+TAG(:,2).^2+TAG(:,3).^2));
%基于任务一处理后的异常数据进行Tag定位
for t = 1:324
    Y1(t,1,:) = min(Y1(t,:,:));
    TAG1(t,:) = Calculate(ANCHOR1,Y1(t,1,:));
end
%异常情况下计算位置与真实位置的相关性
[RX_1,PX_1]=corrcoef(TAG(:,1),TAG1(:,1));
[RY_1,PY_1]=corrcoef(TAG(:,2),TAG1(:,2));
[RZ_1,PZ_1]=corrcoef(TAG(:,3),TAG1(:,3));
[RXY_1,PXY_1]=corrcoef(sqrt((TAG(:,1)).^2+(TAG(:,2)).^2),sqrt(TAG1(:,1).^2+TAG1(:,2).^2));
[RXYZ_1,PXYZ_1]=corrcoef(sqrt((TAG(:,1)).^2+(TAG(:,2)).^2+(TAG(:,3)).^2),sqrt(TAG1(:,1).^2+TAG1(:,2).^2+TAG1(:,3).^2));
%异常情况下计算位置与真实位置的绝对误差平均值（mm）
error_X1 = mean(abs(TAG(:,1)-TAG1(:,1)));
error_Y1 = mean(abs(TAG(:,2)-TAG1(:,2)));
error_Z1 = mean(abs(TAG(:,3)-TAG1(:,3)));
error_XY1 = mean(abs(sqrt((TAG(:,1)-TAG1(:,1)).^2+(TAG(:,2)-TAG1(:,2)).^2)));
error_XYZ1 = mean(abs(sqrt((TAG(:,1)-TAG1(:,1)).^2+(TAG(:,2)-TAG1(:,2)).^2)+(TAG(:,3)-TAG1(:,3)).^2));
%异常情况下计算位置与真实位置的相对误差平均值（%）
ERROR_X1 = mean(abs(TAG(:,1)-TAG1(:,1))./TAG(:,1));
ERROR_Y1 = mean(abs(TAG(:,2)-TAG1(:,2))./TAG(:,2));
ERROR_Z1 = mean(abs(TAG(:,3)-TAG1(:,3))./TAG(:,3));
ERROR_XY1 = mean(abs(sqrt((TAG(:,1)-TAG1(:,1)).^2+(TAG(:,2)-TAG1(:,2)).^2))./sqrt(TAG(:,1).^2+TAG(:,2).^2));
ERROR_XYZ1 = mean(abs(sqrt((TAG(:,1)-TAG1(:,1)).^2+(TAG(:,2)-TAG1(:,2)).^2)+(TAG(:,3)-TAG1(:,3)).^2)./sqrt(TAG(:,1).^2+TAG(:,2).^2+TAG(:,3).^2));
%%对无信号干扰的测量数据进行计算
for t = 1:5
    TAG2(t,:) = Calculate(ANCHOR1,s_test1(t,:));
end
%%对无信号干扰的测量数据进行计算
for t = 1:5
    TAG3(t,:) = Traverse(ANCHOR1,s_test2(t,:));
end

%%
%%任务三：不同场景应用
%绘制实验场景二
figure
scatter3(ANCHOR2(:,1),ANCHOR2(:,2),ANCHOR2(:,3),100,'filled');
xlim([0 5000]);%横轴边界
ylim([0 5000]);%纵轴边界
zlim([0 5000]);%竖轴边界
hold on
scatter3(2500,2500,2500,100,'pentagram');
%%对无信号干扰的测量数据进行计算
for t = 1:5
    TAG4(t,:) = Calculate(ANCHOR2,s_test3(t,:));
end
%%对无信号干扰的测量数据进行计算
for t = 1:5
    TAG5(t,:) = Traverse(ANCHOR2,s_test4(t,:));
end

%%
%%任务四：分类模型


%%
%%任务五：运动轨迹定位
%计算动态靶点的位置坐标
SIZE = size(s2,1);%任务五给出的数据集长度
for t = 1:SIZE
    TAG6(t,:) = Traverse(ANCHOR1,s2(t,:));
end
figure
scatter3(TAG6(:,1),TAG6(:,2),TAG6(:,3))
