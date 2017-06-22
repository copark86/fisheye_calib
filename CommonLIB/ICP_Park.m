function [R, t]=ICP_Park(x, p)

pu = sum(p)/length(p);
xu = sum(x)/length(x);

for k = 1: length(p)
pp(k,:) = p(k,:)-pu;
end
for k = 1: length(x)
xp(k,:) = x(k,:)-xu;
end

[U S V] = svd(xp'*pp);

R = U*V';
t = xu' - R*pu';