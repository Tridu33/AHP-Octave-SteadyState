%和积法——列归行加再归一
function[W0,LambdaMax]=sum_product(matrixOld)
%先编辑数据保存在Data中，运行Data，显示到命令行，有矩阵数据:A_Bi,B1_Ci,B2_Ci,B3_Ci,B4_Ci
n=size(matrixOld,2);%[m,n]=size(Matrix)%特征根Eigenvalue特征向量Eigenvector
format short
%按列归一化
for i=1:n
  matrixNew(:,i)=matrixOld(:,i)/norm(matrixOld(:,i));
end%列归一
Wi=sum(matrixNew,2);
W0=Wi./sum(Wi)%行加再归一
LambdaMax=sum(matrixOld*W0./W0)/n%根据特征向量求特征值
ci=CI(LambdaMax,n);
RI_List=[0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46,1.49,1.52,1.54,1.56,1.58];;%汪书P125随机数1000次跑出来的结果
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

















































































