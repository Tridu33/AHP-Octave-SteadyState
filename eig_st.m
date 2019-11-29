%计算机标准特征根特征值eig(Matrix)法——应该是用的计算方法里面的幂法，或者经过并行优化
function [Max_Eigenvector,Max_Eigenvalue]=eig_st(matrix)
%先编辑数据保存在Data中，运行Data，显示到命令行，有矩阵数据:A_Bi,B1_Ci,B2_Ci,B3_Ci,B4_Ci
n=size(matrix,2);%[m,n]=size(Matrix)
[Eigenvector,Eigenvalue]=eig(matrix);
%特征根Eigenvalue特征向量Eigenvector
%按列归一化Eigenvector./repmat(sqrt(sum(Eigenvector.^2,1)),size(Eigenvector,1),1);
for i=1:n
  Eigenvector(:,i)=Eigenvector(:,i)/norm(Eigenvector(:,i));
end
diag_Eigenvalue=diag(Eigenvalue);%对角矩阵变成向量
Max_Eigenvalue=max(diag_Eigenvalue)%求解最大特征值
index=find(diag_Eigenvalue==Max_Eigenvalue);
Max_Eigenvector=Eigenvector(:,index);
ci=CI(Max_Eigenvalue,n);
RI_List=[0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46,1.49,1.52,1.54,1.56,1.58];
if n>2
  RI=RI_List(n);
 else
  disp("n<3,1/RI=1/0,let RI=eps(Very small)");RI=eps;
end
CR=ci/RI
if CR<0.1
  disp("Pass,C.R<0.1")
else 
  disp("Fail,C.R>0.1")
end
