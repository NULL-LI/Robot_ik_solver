function outMatrix = check_theta_variable(inputT)
%CHECK_THETA_VARIABLE 此处显示有关此函数的摘要
%   此处显示详细说明
t=sym('t%d',[1,6]);

outMatrix=zeros(3,4);
for i=1:3
    for j=1:4
        for n=1:6
            if(has(inputT(i,j),t(n)))
                outMatrix(i,j)=outMatrix(i,j)*10+n;
            end
        end
%         while(rem(outMatrix(i,j),10)==0&&outMatrix(i,j)~=0)
% %             disp(outMatrix(i,j));
%             outMatrix(i,j)=outMatrix(i,j)/10;
%         end
        
    end
end


end

