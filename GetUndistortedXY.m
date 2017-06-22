
function [xo yo r theta] = GetUndistortedXY(x,y,K,invK,f)

p_normal=invK*[x y 1]';
x = p_normal(1);
y = p_normal(2);

rp=sqrt(x*x+y*y);


%theta = (rp/f);
load Q
M = [-1 3 -3 1;3 -6 3 0; -3 0 3 0;1 4 1 0];

% divide Number of Control points by Nbs steps
index_f = Nq*(rp/3);

% current control point index
index_int = floor(index_f);

t_ = index_f-index_int;
tv = [t_^3 t_^2 t_ 1];


% control points index 
indexV =( index_int-1:index_int+2)+1;
indexV(find(indexV<1))=1;
indexV(find(indexV>Nq))=Nq;

Q_4 = Q(indexV,:); 
pbs=tv*M*Q_4/6;

    
    theta=pbs;

r = f*tan(theta);



ratio = r/rp;

xo = x*ratio;
yo = y*ratio;


p_img=K*[xo yo 1]';

xo = p_img(1);

yo = p_img(2);