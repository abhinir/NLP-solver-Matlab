function X = euler_prop(model,t,x,u,dt,n)
temp = x;
for i = 1:1:n
    temp = temp + model.eom(model,t,temp,u)*(dt/n);
end
X = temp;
end