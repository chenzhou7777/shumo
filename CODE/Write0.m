function Write0(t,Y)
%将正常情况数据输出
NAME = ([num2str(t),'.正常.txt']);
fid=fopen(NAME,'wt');%写入文件路径
[m1,n1]=size(Y);
for i=1:1:m1
    for j=1:1:n1
        if j==n1
            fprintf(fid,'%g\n',Y(i,j));
        else
            fprintf(fid,'%g\t',Y(i,j));
        end
    end
end
fclose(fid);