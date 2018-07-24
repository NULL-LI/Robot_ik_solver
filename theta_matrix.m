clear;
clc;
close all;

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

thetaMatrix=zeros(3,4,7);
equationMatrix=sym('equation%d',[3,4,7]);

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
simplify(T)



Tf=[nf1,of1,af1,pf1;
    nf2,of2,af2,pf2;
    nf3,of3,af3,pf3;
    0,0,0,1
    ];

i=1;

disp('T14');
T14=T1*T2*T3*T4;
T41=Tf/T6/T5;

 
 tmp_equation_matrix=simplify(T14-T41);
  class(equationMatrix(:,:,i))
 class(simplify(T14-T41))
 class(tmp_equation_matrix)
equationMatrix(1,1,i)=tmp_equation_matrix(1,1);
thetaMatrix(:,:,i)=check_theta_variable();
i=i+1;

tmp1=simplify(T14-T41);
disp("t6");
simplify(tmp1(1,2))
simplify(tmp1(2,2))
simplify(tmp1(3,2))


disp("t3");
tmp1=simplify(T14-T41);
simplify(tmp1(3,4))


disp('T25');
equationMatrix(:,:,i)=simplify(T2*T3*T4*T5-T1\Tf/T6);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;

tmp1=simplify(T2*T3*T4*T5-T1\Tf/T6);
disp("t1");
simplify(tmp1(3,4))
% theta1 = simplify(solve(tmp1(3,4)-tmp2(3,4),t(1)))
disp("t5");
simplify(tmp1(3,3))
% theta5 = simplify(solve(tmp1(3,3)-tmp2(3,3),t(5)))
disp("t6");
simplify(tmp1(3,2))
simplify(tmp1(3,1))
% theta6 = simplify(solve(tmp1(3,2)-tmp2(3,2),t(6)))

disp('T36');
equationMatrix(:,:,i)=simplify(T3*T4*T5*T6-T2\T1\Tf);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;


disp('T13');
equationMatrix(:,:,i)=simplify(T1*T2*T3-Tf/T6/T5/T4);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;


disp('T24');
equationMatrix(:,:,i)=simplify(T2*T3*T4-T1\Tf/T6/T5);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;


disp('T35');
equationMatrix(:,:,i)=simplify(T3*T4*T5-T2\T1\Tf/T6);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;


tmp1=simplify(T3*T4*T5-T2\T1\Tf/T6);
disp("t2");
simplify(tmp1(3,3))
disp("t4");
simplify(tmp1(2,4))

disp('T46');
equationMatrix(:,:,i)=simplify(T4*T5*T6-T3\T2\T1\Tf);
thetaMatrix(:,:,i)=check_theta_variable(equationMatrix(:,:,i));
i=i+1;

equationMatrix
thetaMatrix
