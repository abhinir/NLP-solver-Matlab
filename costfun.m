function J = costfun(model,X,N,dt)

x = zeros(model.nx,N+1);

Q = dt*model.Q;
R = dt*model.R;
Qf = model.Qf;

x(:,1) = model.x0;
x(:,2:end) = X(1:model.nx,:);

e = compute_error(model,x,N);
u = X(model.nx+1:end,:);

J = 0;
for i = 1:1:N
    J = J + 0.5*(e(:,i)'*Q*e(:,i)) + 0.5*(u(:,i)'*R*u(:,i));
end
J = J + 0.5*(e(:,end)'*Qf*e(:,end));
end