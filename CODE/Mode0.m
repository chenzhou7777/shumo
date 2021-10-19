function Y = Mode0(X,T)
%对每类数据取众数
m = size(T,1);
n1 = 1;
n2 = 1;
n3 = 1;
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

Y = [X1a X1b X1c X1d
    X2a X2b X2c X2d
    X3a X3b X3c X3d];