function X = RK45_prop(model,t,x,u,dt)
[~,X] = ode45(@(tt,y) model.eom(model,tt,y,u),[t t+dt],x); 
X = X(end,:)';
end