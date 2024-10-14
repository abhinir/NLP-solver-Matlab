function out = dyneqn_cartpole(model,t,x,u)

g = model.g;
M = model.M;
m = model.m;
L = model.L;

theta = x(3);
theta_dot = x(4);
term1 = m/(M + m - m*(cos(theta)^2)); %intermediate variable
term2 = term1*(g*sin(theta)*cos(theta) - L*sin(theta)*(theta_dot^2));

out = zeros(4,1);

out(1) = x(2);
out(2) = term2 + term1*u/m;
out(3) = x(4);
out(4) = (g*sin(theta)/L) + (cos(theta)/L)*term2 +...
    (cos(theta)/L)*term1*u/m;

end