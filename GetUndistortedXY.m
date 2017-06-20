
function [xo yo] = GetUndistortedXY(x,y,K,invK,f)

p_normal=invK*[x y 1]';
x = p_normal(1);
y = p_normal(2);

rp=sqrt(x*x+y*y);
theta = (rp/f);


    r = f*tan(theta);



    ratio = r/rp;

    xo = x*ratio;
    yo = y*ratio;


p_img=K*[xo yo 1]';

xo = p_img(1);

yo = p_img(2);