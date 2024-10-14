function out = dyneqn_softLand(model,t,x,u)

q1 = x(1);
q2 = x(2);
q3 = x(3);
q4 = x(4);
w1 = x(5);
w2 = x(6);
w3 = x(7);
r1 = x(8);
r2 = x(9);
r3 = x(10);
v1 = x(11);
v2 = x(12);
v3 = x(13);

out = zeros(13,1);

omega = [w1;w2;w3];
v = [v1;v2;v3];
q_cross = [0, -q3, q2;...
           -q1, 0, q3;...
           q1, -q2, 0];  
zeta1 = q4*eye(3);

zeta = [zeta1 + q_cross;...
        -q1,-q2,-q3];

psi = [zeta1 - q_cross;...
        -q1, -q2 -q3];
R = zeta'*psi;
F = model.d1*u(1) + model.d2*u(2) + model.d3*u(3) + model.d4*u(4);
F = R'*F;

torque = cross(model.r1,model.d1*u(1)) + ...
            cross(model.r2,model.d2*u(2)) + ...
            cross(model.r3,model.d3*u(3)) + ...
            cross(model.r4,model.d4*u(4));

torque = R'*torque;


out(1:4) = 0.5*zeta*omega;
out(5:7) = -inv(model.J)*cross(omega,model.J*omega) + inv(model.J)*torque;
out(8:10) = v;
out(11:13) = F/(model.m) + model.g;
end