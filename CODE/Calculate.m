function tag = Calculate(ANCHOR,Y)
%基于最小二乘法的思想，从距离得到位置坐标
x1 = ANCHOR(1,1);
y1 = ANCHOR(1,2);
z1 = ANCHOR(1,3);
x2 = ANCHOR(2,1);
y2 = ANCHOR(2,2);
z2 = ANCHOR(2,3);
x3 = ANCHOR(3,1);
y3 = ANCHOR(3,2);
z3 = ANCHOR(3,3);
x4 = ANCHOR(4,1);
y4 = ANCHOR(4,2);
z4 = ANCHOR(4,3);

j = size(Y,1);
%先对数据进行拟合修正
for i = 1:j
    D(i,1) = Y(i,1)-29;
    D(i,2) = Y(i,2)+41;
    D(i,3) = Y(i,3)+47;
    D(i,4) = Y(i,4)+42;
end
%求解矩阵方程
for i = 1:j
    P(i,1) = D(i,2)^2-D(i,1)^2-x2^2+x1^2-y2^2+y1^2-z2^2+z1^2;
    P(i,2) = D(i,3)^2-D(i,1)^2-x3^2+x1^2-y3^2+y1^2-z3^2+z1^2;
    P(i,3) = D(i,4)^2-D(i,1)^2-x4^2+x1^2-y4^2+y1^2-z4^2+z1^2;
end
A = [x1-x2 y1-y2 z1-z2;
    x1-x3 y1-y3 z1-z3;
    x1-x4 y1-y4 z1-z4];
ZZZ = A\P';
ZX = mean(ZZZ(1,:))/2;
ZY = mean(ZZZ(2,:))/2;
%对Z坐标进行遍历反演
for i = 1:5001
    j = i;
    distance(j,:) = [sqrt((ZX-ANCHOR(1,1))^2+(ZY-ANCHOR(1,2))^2+(i-ANCHOR(1,3))^2)-D(1,1)
        sqrt((ZX-ANCHOR(2,1))^2+(ZY-ANCHOR(2,2))^2+(i-ANCHOR(2,3))^2)-D(1,2)
        sqrt((ZX-ANCHOR(3,1))^2+(ZY-ANCHOR(3,2))^2+(i-ANCHOR(3,3))^2)-D(1,3)
        sqrt((ZX-ANCHOR(4,1))^2+(ZY-ANCHOR(4,2))^2+(i-ANCHOR(4,3))^2)-D(1,4)];
    RMS(j) = rms(distance(j,:));
end
%取反演后能得到最小误差的位置坐标
n = find(RMS==min(RMS));
ZZ = n;
tag = [ZX,ZY,ZZ];
