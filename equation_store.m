function outMatrix = equation_store(equationMatrix,tmp_equation_matrix,ite)
%EQUATION_STORE 此处显示有关此函数的摘要
%   此处显示详细说明
for i=1:3
    for j=1:4
        equationMatrix(i,j,ite)=tmp_equation_matrix(i,j);
    end
end

outMatrix=equationMatrix;
end

