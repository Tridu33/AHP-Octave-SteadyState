%������,�г˿�������һ
function [W0,LambdaMax]=power_root(matrix)
%�ȱ༭���ݱ�����Data�У�����Data����ʾ�������У��о�������:A_Bi,B1_Ci,B2_Ci,B3_Ci,B4_Ci
n=size(matrix,2);%[m,n]=size(Matrix)%������Eigenvalue��������Eigenvector
format short
Wi=(prod(matrix,2)).^(1/n);W0=Wi./sum(Wi)%�г˸���һ
LambdaMi=matrix*W0./W0
LambdaMax=sum(matrix*W0./W0)/n%������������������ֵ
cI=CI(LambdaMax,n)
RI_List=[0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46,1.49,1.52,1.54,1.56,1.58];%����P125�����1000���ܳ����Ľ��
if n>2
  RI=RI_List(n);
 else
  disp("n<3,1/RI=1/0,let RI=eps(Very small)");RI=eps;
end
CR=cI/RI
if CR<0.1
  disp("Pass,C.R<0.1")
else 
  disp("Fail,C.R>0.1")
end

































































