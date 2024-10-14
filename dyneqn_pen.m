function out = dyneqn_pen(model,t,x,u)
m = model.m;
L = model.L;
g = model.g;

out = zeros(2,1);

out(1) = x(2);
out(2) = -9.81*sin(x(1))/L + u/(m*L^2);
end