%-------------------------------------------------------
% Composition of a transformation and a set of points
%-------------------------------------------------------
% E2R([0 0 0 0 0 0]) Identity matrix
function [T R] = E2R(Tab, Pb)
sx = sin(Tab(4));
cx = cos(Tab(4));
sy = sin(Tab(5));
cy = cos(Tab(5));
sz = sin(Tab(6));
cz = cos(Tab(6));

% Rotmat.m에서 아래를 계한해놓았음
% R = (rotz(rz)*roty(ry)*rotx(rx))'
%  
% ans =
%  
% [ cos(ry)*cos(rz), cos(rz)*sin(rx)*sin(ry) - cos(rx)*sin(rz), sin(rx)*sin(rz) + cos(rx)*cos(rz)*sin(ry), 0]
% [ cos(ry)*sin(rz), cos(rx)*cos(rz) + sin(rx)*sin(ry)*sin(rz), cos(rx)*sin(ry)*sin(rz) - cos(rz)*sin(rx), 0]
% [        -sin(ry),                           cos(ry)*sin(rx),                           cos(rx)*cos(ry), 0]
% [               0,                                         0,                                         0, 1]
 
  R = [cy*cz    sz*sy*cz-cx*sz      cx*sy*cz+sx*sz
        cy*sz   sx*sy*sz+cx*cz      cx*sy*sz-sx*cz 
        -sy       sx*cy               cx*cy];

T = [R Tab(1:3)'
%T = [R' -R'*Tab(1:3)'
    (1:3)*0 1]
    

%치명적인 실수를 함. 식을 잘못 써놨다. 
%   R = [cy*cz           cy*sz           -sy  
%     sz*sy*cz-cx*sz  sx*sy*sz+cx*cz  sx*cy
%     cx*sy*cz+sx*sz  cx*sy*sz-sx*cz  cx*cy];
% 
% %원래식
% T = [R Tab(1:3)'
% 
% 
% T = [R -R*Tab(1:3)'
%     (1:3)*0 1]

