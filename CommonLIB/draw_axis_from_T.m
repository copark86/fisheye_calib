%-------------------------------------------------------
function draw_axis_from_T(Ttmp,txt,axis_lehght)
if nargin < 3
    axis_lehght = 30;
end
hold on

v = [ Ttmp(1:3,1) Ttmp(1:3,2) Ttmp(1:3,3) ;[1 1 1]]*axis_lehght;      
c = [ Ttmp(1:3,4) Ttmp(1:3,4) Ttmp(1:3,4)];
    

quiver3(c(1,1),c(2,1),c(3,1),v(1,1),v(2,1),v(3,1),'r','LineWidth', 5)
quiver3(c(1,2),c(2,2),c(3,2),v(1,2),v(2,2),v(3,2),'g','LineWidth', 5)
quiver3(c(1,3),c(2,3),c(3,3),v(1,3),v(2,3),v(3,3),'b','LineWidth', 5)


text(double(c(1,1)+v(1,1)),double(c(2,1)+v(2,1)),double(c(3,1)+v(3,1)),'x')
text(double(c(1,2)+v(1,2)),double(c(2,2)+v(2,2)),double(c(3,2)+v(3,2)),'y')
text(double(c(1,3)+v(1,3)),double(c(2,3)+v(2,3)),double(c(3,3)+v(3,3)),'z')



if (nargin > 1)
 
     text(double(c(1,1)),double(c(2,1)),double(c(3,1)),txt)
    
end
  hold off
