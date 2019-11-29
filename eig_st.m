%�������׼����������ֵeig(Matrix)������Ӧ�����õļ��㷽��������ݷ������߾��������Ż�
function [Max_Eigenvector,Max_Eigenvalue]=eig_st(matrix)
%�ȱ༭���ݱ�����Data�У�����Data����ʾ�������У��о�������:A_Bi,B1_Ci,B2_Ci,B3_Ci,B4_Ci
n=size(matrix,2);%[m,n]=size(Matrix)
[Eigenvector,Eigenvalue]=eig(matrix);
%������Eigenvalue��������Eigenvector
%���й�һ��Eigenvector./repmat(sqrt(sum(Eigenvector.^2,1)),size(Eigenvector,1),1);
for i=1:n
  Eigenvector(:,i)=Eigenvector(:,i)/norm(Eigenvector(:,i));
end
diag_Eigenvalue=diag(Eigenvalue);%�ԽǾ���������
Max_Eigenvalue=max(diag_Eigenvalue)%����������ֵ
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
