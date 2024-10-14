function out = dyneqn_car(model,t,x,u)

L = model.L;

out = zeros(4,1);

theta = x(3);
phi = x(4);

u1 = u(1,:);
u2 = u(2,:);

out(1) = u1*cos(theta);
out(2) = u1*sin(theta);
out(3) = u1*tan(phi)/L;
out(4) = u2;
end