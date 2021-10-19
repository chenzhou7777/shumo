function s = Change(A,k2) 
%从字符串中提取有效数据
for k = 1:k2
    B1 = char(A((k-1)*4+1,1));
    B2 = char(A((k-1)*4+2,1));
    B3 = char(A((k-1)*4+3,1));
    B4 = char(A((k-1)*4+4,1));
    if B1(22) ==':'
        s(k,1)= str2num(B1(20:21));
    end
    if B1(23) ==':'
        s(k,1)= str2num(B1(20:22));
    end
    if B1(24) ==':'
        s(k,1)= str2num(B1(20:23));
    end
    if B2(22) ==':'
        s(k,2)= str2num(B2(20:21));
    end
    if B2(23) ==':'
        s(k,2)= str2num(B2(20:22));
    end
    if B2(24) ==':'
        s(k,2)= str2num(B2(20:23));
    end
    if B3(22) ==':'
        s(k,3)= str2num(B3(20:21));
    end
    if B3(23) ==':'
        s(k,3)= str2num(B3(20:22));
    end
    if B3(24) ==':'
        s(k,3)= str2num(B3(20:23));
    end
    if B4(22) ==':'
        s(k,4)= str2num(B4(20:21));
    end
    if B4(23) ==':'
        s(k,4)= str2num(B4(20:22));
    end
    if B4(24) ==':'
        s(k,4)= str2num(B4(20:23));
    end
end