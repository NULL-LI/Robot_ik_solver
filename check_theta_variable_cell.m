function outMatrix = check_theta_variable_cell(inputT)
%CHECK_THETA_VARIABLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
t=sym('t%d',[1,6]);

outMatrix=cell(3,4);
outMatrix(:,:) = {[]};

for i=1:3
    for j=1:4         
        for n=1:6
            if(has(inputT(i,j),t(n)))
                outMatrix{i,j}=[outMatrix{i,j},n];
            end
        end
%         while(rem(outMatrix(i,j),10)==0&&outMatrix(i,j)~=0)
% %             disp(outMatrix(i,j));
%             outMatrix(i,j)=outMatrix(i,j)/10;
%         end
        
    end
end


end
