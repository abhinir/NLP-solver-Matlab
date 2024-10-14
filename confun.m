function [c, ceq] = confun(model,X,N,dt,n,int_type)

x = zeros(model.nx,N+1);
x(:,1) = model.x0;
x(:,2:end) = X(1:model.nx,:);
u = X(model.nx+1:end,:);
Ceq = zeros(model.nx,1);
ceq = [];
for i = 1:1:N
    t = i*dt - dt;
    if strcmp(int_type,'euler')
        Ceq = x(:,i+1) - euler_prop(model,t,x(:,i),u(:,i),dt,n);
    elseif strcmp(int_type,'RK45')
        Ceq = x(:,i+1) - RK45_prop(model,t,x(:,i),u(:,i),dt);
    end
    ceq = [ceq;Ceq];
end

c = [];
end