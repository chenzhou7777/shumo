function d = Del(s)
%%删除异常数据
k0 = size(s,2);
d = zeros(324,k0,4);
for i = 1:324
    j=1;
    for k = 1:k0
        if s(i,k,1)~=0
            if (s(i,k,1)<7272&&s(i,k,2)<7272)&&(s(i,k,3)<7272&&s(i,k,4)<7272)
                if k==1
                    d(i,j,:)=s(i,k,:);
                    j=j+1;
                elseif ((abs(s(i,k,1)-s(i,k-1,1)))/s(i,k-1,1)<0.2)&&((abs(s(i,k,2)-s(i,k-1,2)))/s(i,k-1,2)<0.2)&&((abs(s(i,k,3)-s(i,k-1,3)))/s(i,k-1,3)<0.2)&&((abs(s(i,k,4)-s(i,k-1,4)))/s(i,k-1,4)<0.2)
                    d(i,j,:)=s(i,k,:);
                    j=j+1;
                end
            end
        end
    end
end
    
    