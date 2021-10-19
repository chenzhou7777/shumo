function Write1(t,Y)
%将异常情况数据输出
NAME = ([num2str(t),'.异常.txt']);
fid=fopen(NAME,'wt');%写入文件路径
[m,n]=size(Y);
for i=1:m
    for j=1:n
        if j==n
            fprintf(fid,'%g\n',Y(i,j));
        else
            fprintf(fid,'%g\t',Y(i,j));
        end
    end
end
fclose(fid);