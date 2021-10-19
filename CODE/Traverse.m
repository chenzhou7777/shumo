function tag = Traverse (ANCHOR,YY)
%从五种情况中遍历出误差最小的位置坐标
Point(1,:) = Calculate(ANCHOR,YY);
Point(2,:) = Calculate(ANCHOR,[YY(1)-479,YY(2),YY(3),YY(4)]);
Point(3,:) = Calculate(ANCHOR,[YY(1),YY(2)-479,YY(3),YY(4)]);
Point(4,:) = Calculate(ANCHOR,[YY(1),YY(2),YY(3)-479,YY(4)]);
Point(5,:) = Calculate(ANCHOR,[YY(1),YY(2),YY(3),YY(4)-479]);
for i=1:5
    distance(i,:) = [sqrt((Point(i,1)-ANCHOR(1,1))^2+(Point(i,2)-ANCHOR(1,2))^2+(Point(i,3)-ANCHOR(1,3))^2) 
        sqrt((Point(i,1)-ANCHOR(2,1))^2+(Point(i,2)-ANCHOR(2,2))^2+(Point(i,3)-ANCHOR(2,3))^2)
        sqrt((Point(i,1)-ANCHOR(3,1))^2+(Point(i,2)-ANCHOR(3,2))^2+(Point(i,3)-ANCHOR(3,3))^2)
        sqrt((Point(i,1)-ANCHOR(4,1))^2+(Point(i,2)-ANCHOR(4,2))^2+(Point(i,3)-ANCHOR(4,3))^2)];
end
%求通过测量位置反演得到的距离与初始距离的误差
d(1) = (distance(1,1)-YY(1))^2+(distance(1,2)-YY(2))^2+(distance(1,3)-YY(3))^2+(distance(1,4)-YY(4))^2;
d(2) = (distance(1,1)-YY(1)+479)^2+(distance(1,2)-YY(2))^2+(distance(1,3)-YY(3))^2+(distance(1,4)-YY(4))^2;
d(3) = (distance(1,1)-YY(1))^2+(distance(1,2)-YY(2)+479)^2+(distance(1,3)-YY(3))^2+(distance(1,4)-YY(4))^2;
d(4) = (distance(1,1)-YY(1))^2+(distance(1,2)-YY(2))^2+(distance(1,3)-YY(3)+479)^2+(distance(1,4)-YY(4))^2;
d(5) = (distance(1,1)-YY(1))^2+(distance(1,2)-YY(2))^2+(distance(1,3)-YY(3))^2+(distance(1,4)-YY(4)+479)^2;
n = find(d==min(d));%取误差最小的情况
tag = Point(n,:);