function outMatrix = equation_store(equationMatrix,tmp_equation_matrix,ite)
%EQUATION_STORE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i=1:3
    for j=1:4
        equationMatrix(i,j,ite)=tmp_equation_matrix(i,j);
    end
end

outMatrix=equationMatrix;
end

