clear;
clc;
close all;

equationMatrixNum=7;

t=sym('t%d',[1,6]);
al=sym('al%d',[1,6]);
a=sym('a%d',[1,6]);
d=sym('d%d',[1,6]);
for i=1:6
    syms (['nf',num2str(i)]);
    syms (['of',num2str(i)]);
    syms (['af',num2str(i)]);
    syms (['pf',num2str(i)]);
end

d(2)=0;
d(3)=0;

a(1)=0;
a(4)=0;
a(5)=0;
a(6)=0;

al(1)=pi/2;
al(2)=0;
al(3)=0;
al(4)=pi/2;
al(5)=-pi/2;
al(6)=0;

thetaMatrix=cell(3,4,equationMatrixNum);
equationMatrix=sym('equation%d',[3,4,equationMatrixNum]);

i=1;
T1=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

i=2;
T2=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

i=3;
T3=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

i=4;
T4=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

i=5;
T5=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

i=6;
T6=[cos(t(i)),-sin(t(i))*cos(al(i)),sin(t(i))*sin(al(i)),a(i)*cos(t(i));
    sin(t(i)),cos(t(i))*cos(al(i)),-cos(t(i))*sin(al(i)),a(i)*sin(t(i));
    0,sin(al(i)),cos(al(i)),d(i);
    0,0,0,1
    ];

% disp(T1);disp(T2);disp(T3);disp(T4);disp(T5);disp(T6);

T=T1*T2*T3*T4*T5*T6;
disp('Forward kinematics :');
disp(simplify(T));



Tf=[nf1,of1,af1,pf1;
    nf2,of2,af2,pf2;
    nf3,of3,af3,pf3;
    0,0,0,1
    ];

i=1;

% disp('T14');
equationMatrix=equation_store(equationMatrix,simplify(T1*T2*T3*T4-Tf/T6/T5),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;


% disp('T25');
equationMatrix=equation_store(equationMatrix,simplify(T2*T3*T4*T5-T1\Tf/T6),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;

% disp('T36');
equationMatrix=equation_store(equationMatrix,simplify(T3*T4*T5*T6-T2\T1\Tf),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;


% disp('T13');
equationMatrix=equation_store(equationMatrix,simplify(T1*T2*T3-Tf/T6/T5/T4),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;


% disp('T24');
equationMatrix=equation_store(equationMatrix,simplify(T2*T3*T4-T1\Tf/T6/T5),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;


% disp('T35');
equationMatrix=equation_store(equationMatrix,simplify(T3*T4*T5-T2\T1\Tf/T6),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;

% disp('T46');
equationMatrix=equation_store(equationMatrix,simplify(T4*T5*T6-T3\T2\T1\Tf),i);
thetaMatrix(:,:,i)=check_theta_variable_cell(equationMatrix(:,:,i));
i=i+1;

disp(' ');

knownVariables=[];
k=1;
while(length(knownVariables)<6&&k<10)
    str=sprintf('\nStep %d',k);
    disp(str);
    k=k+1;
    for i=1:3
        for j=1:4
            for n=1:equationMatrixNum
                if ~isempty(knownVariables)
                    for m=1:length(knownVariables)
                        thetaMatrix{i,j,n}(find(thetaMatrix{i,j,n}==knownVariables(m)))=[] ;
                    end
                end
            end
            for n=1:equationMatrixNum
                if(length(thetaMatrix{i,j,n})==1)
                    if(~ismember(thetaMatrix{i,j,n}(1),knownVariables))
                        knownVariables=[knownVariables,thetaMatrix{i,j,n}(1)];
                    end
                    disp(thetaMatrix{i,j,n});
                    disp(equationMatrix(i,j,n));
                end
            end
        end
    end
end




