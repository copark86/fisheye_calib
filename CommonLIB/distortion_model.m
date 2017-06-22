function f = distortion_model(r,k)
k1=k(1);
k2=k(2);
k3=k(3);
f =  ((1 + k1*r.^2 + k2*(r.^4) + k3*(r.^6)));