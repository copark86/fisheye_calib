
%-------------------------------------------------------
function rot_mat = rot_vec(v,theta)
x= v(1);
y= v(2);
z= v(3);
rot_mat=[
  cos(theta)+(1-cos(theta))*x^2       -z*sin(theta)+(1-cos(theta))*x*y        y*sin(theta)+(1-cos(theta))*x*z  
 z*sin(theta)+(1-cos(theta))*x*y            cos(theta)+(1-cos(theta))*y^2     -x*sin(theta)+(1-cos(theta))*y*z  
-y*sin(theta)+(1-cos(theta))*x*z           x*sin(theta)+(1-cos(theta))*y*z        cos(theta)+(1-cos(theta))*z^2 
];