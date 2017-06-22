%-------------------------------------------------------
function draw_axis_from_T_2D(Ttmp,txt,axis_lehght)
if nargin < 3
    axis_lehght = 30;
end
hold on

v = [ Ttmp(1:2,1) Ttmp(1:2,2)  ;[1 1]]*axis_lehght;      
c = [ Ttmp(1:2,3) Ttmp(1:2,3) ];
    

quiver(c(1,1),c(2,1),v(1,1),v(2,1),'r','LineWidth', 5)
quiver(c(1,2),c(2,2),v(1,2),v(2,2),'g','LineWidth', 5)



text(double(c(1,1)+v(1,1)),double(c(2,1)+v(2,1)),'x')
text(double(c(1,2)+v(1,2)),double(c(2,2)+v(2,2)),'y')


if (nargin > 1)
 
     text(double(c(1,1)),double(c(2,1)),txt)
    
end
  hold off
