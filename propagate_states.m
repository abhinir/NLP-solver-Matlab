function out = propagate_states(model,u,N,dt,n,int_type)

out = zeros(model.nx,N+1);
out(:,1) = model.x0;

for i = 1:1:N
    t = i*dt - dt;
    if strcmp(int_type,'euler')
        out(:,i+1) = euler_prop(model,t,out(:,i),u(:,i),dt,n);
    elseif strcmp(int_type,'RK45')
        out(:,i+1) = RK45_prop(model,t,out(:,i),u(:,i),dt);
    end
end

end