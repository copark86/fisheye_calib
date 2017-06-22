function [R, t, q]=ICP_Park_Quat(x, p)

pu = sum(p)/length(p);
xu = sum(x)/length(x);

for k = 1: length(p)
pp(k,:) = p(k,:)-pu;
end
for k = 1: length(x)
xp(k,:) = x(k,:)-xu;
end


s=(xp'*pp)/length(p);
A=s-s';
d = [A(2,3) A(3,1) A(1,2)];
Q =  [trace(s) d;d' (s+s'-trace(s)*eye(3,3))];
 
[V D]=eig(Q);
q = V(1:4,4);

R=quat2dcm(q');

t = xu' - R*pu';

