function Y = Mode1(X,T)
%对每类数据取众数
m = size(T,1);
n1 = 1;
n2 = 1;
n3 = 1;
n4 = 1;
n5 = 1;
n6 = 1;
for k = 1:m
    if T(k)==1
        X1(n1,:) = X(k,:);
        n1=n1+1;
    end
    if T(k)==2
        X2(n2,:) = X(k,:);
        n2=n2+1;
    end
    if T(k)==3
        X3(n3,:) = X(k,:);
        n3=n3+1;
    end
    if T(k)==4
        X4(n4,:) = X(k,:);
        n4=n4+1;
    end
    if T(k)==5
        X5(n5,:) = X(k,:);
        n5=n5+1;
    end
    if T(k)==6
        X6(n6,:) = X(k,:);
        n6=n6+1;
    end
end

X1a = mode(X1(:,1));
a1 = find(X1(:,1)==X1a);
X1b = mode(X1(a1,2));
b1 = find(X1(:,2)==X1b);
X1c = mode(X1(intersect(a1,b1),3));
c1 = find(X1(:,3)==X1c);
X1d = mode(X1(intersect(c1,intersect(a1,b1)),4));

X2a = mode(X2(:,1));
a2 = find(X2(:,1)==X2a);
X2b = mode(X2(a2,2));
b2 = find(X2(:,2)==X2b);
X2c = mode(X2(intersect(a2,b2),3));
c2 = find(X2(:,3)==X2c);
X2d = mode(X2(intersect(c2,intersect(a2,b2)),4));

X3a = mode(X3(:,1));
a3 = find(X3(:,1)==X3a);
X3b = mode(X3(a3,2));
b3 = find(X3(:,2)==X3b);
X3c = mode(X3(intersect(a3,b3),3));
c3 = find(X3(:,3)==X3c);
X3d = mode(X3(intersect(c3,intersect(a3,b3)),4));

X4a = mode(X4(:,1));
a4 = find(X4(:,1)==X4a);
X4b = mode(X4(a4,2));
b4 = find(X4(:,2)==X4b);
X4c = mode(X4(intersect(a4,b4),3));
c4 = find(X4(:,3)==X4c);
X4d = mode(X4(intersect(c4,intersect(a4,b4)),4));

X5a = mode(X5(:,1));
a5 = find(X5(:,1)==X5a);
X5b = mode(X5(a5,2));
b5 = find(X5(:,2)==X5b);
X5c = mode(X5(intersect(a5,b5),3));
c5 = find(X5(:,3)==X5c);
X5d = mode(X5(intersect(c5,intersect(a5,b5)),4));

X6a = mode(X6(:,1));
a6 = find(X6(:,1)==X6a);
X6b = mode(X6(a6,2));
b6 = find(X6(:,2)==X6b);
X6c = mode(X6(intersect(a6,b6),3));
c6 = find(X6(:,3)==X6c);
X6d = mode(X6(intersect(c6,intersect(a6,b6)),4));

Y = [X1a X1b X1c X1d
    X2a X2b X2c X2d
    X3a X3b X3c X3d
    X4a X4b X4c X4d
    X5a X5b X5c X5d
    X6a X6b X6c X6d];