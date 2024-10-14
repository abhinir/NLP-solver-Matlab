function model = model_params(modelName)


if strcmp(modelName,'car')
    model.name = 'car';
    model.nx = 4;
    model.nu = 2;
    model.x0 = [-1;-4;pi/3;0];
    model.xf = [1;4;pi/2;0];
    model.L = 0.58;
    model.R = 10*eye(model.nu);
    model.Q = 50*eye(model.nx);
    model.Qf = 1000*eye(model.nx);
    model.eom = @dyneqn_car;
elseif strcmp(modelName,'pendulum')
    model.name = 'pendulum';
    model.nx = 2;
    model.nu = 1;
    model.x0 = [0;0];
    model.xf = [pi;0];
    model.L = 0.5;
    model.m = 0.5;
    model.g = 9.81;
    model.R = 10*eye(model.nu);
    model.Q = 100*eye(model.nx);
    model.Qf = 1000*eye(model.nx);
    model.eom = @dyneqn_pen;
elseif strcmp(modelName,'cartpole')
    model.name = 'cartpole';
    model.nx = 4;
    model.nu = 1;
    model.x0 = [0;0;pi;0];
    model.xf = [0;0;0;0];
    model.L = 0.6;
    model.m = 0.01;
    model.M = 1;
    model.g = 9.81;
    model.R = 10*eye(model.nu);
    model.Q = 100*eye(model.nx);
    model.Qf = 1000*eye(model.nx);
    model.eom = @dyneqn_cartpole;
elseif strcmp(modelName,'unicycle')
    model.name = 'unicycle';
    model.nx = 3;
    model.nu = 2;
    model.x0 = [0;0;pi];
    model.xf = [0;0;0;0];
    model.L = 0.6;
    model.m = 0.01;
    model.M = 1;
    model.g = 9.81;
    model.R = 10*eye(model.nu);
    model.Q = 100*eye(model.nx);
    model.Qf = 1000*eye(model.nx);
    model.eom = @dyneqn_unicycle;
elseif strcmp(modelName,'softLand')
    model.name = 'softLand';
    model.nx = 13;
    model.nu = 4;
    model.x0 = [0.5;0.1;0.2;sqrt(0.7);0.01;0.01;0.01;100;200;300;5;6;7];
    model.xf = zeros(13,1);
    model.R = 1e-6*eye(model.nu);
    model.Q = diag([1e3;1e3;1e3;1e3;1e4;1e4;1e4;1;1;1;10;10;10]);
    model.Qf = diag([1e3;1e3;1e3;1e3;1e4;1e4;1e4;1;1;1;10;10;10]);
    model.r1 = [0;-2;-1];
    model.r2 = [0;2;-1];
    model.r3 = [-2;0;-1];
    model.r4 = [2;0;-1];
    model.d1 = [0;0;1];
    model.d2 = [0;0;1];
    model.d3 = [0;0;-1];
    model.d4 = [0;0;-1];
    model.m = 2000;
    model.J = [4500,0,0;0,6000,0;0,0,7000];
    model.g = [0;0;-3.7];
    model.eom = @dyneqn_softLand;
elseif strcmp(modelName,'att_con')
    model.name = 'att_con';
    model.nx = 6;
    model.nu = 3;
    model.x0 = [0.5;0.1;0.2;0.1;-0.1;0.05];
    model.xf = zeros(6,1);
    model.R = 1e1*eye(model.nu);
    model.Q = 1e2*eye(model.nx);
    model.Qf = 1e5*eye(model.nx);
    model.m = 2000;
    model.J = [4500,0,0;0,6000,0;0,0,7000];
    model.eom = @dyneqn_att_con;
elseif strcmp(modelName,'toy_rao')
    model.name = 'toy_rao';
    model.nx = 1;
    model.nu = 1;
    model.x0 = 1;
    model.xf = 1.5;
    model.R = 20;
    model.Q = 20;
    model.Qf = 1e10*eye(model.nx);
    model.eom = @dyneqn_toy_rao;
end
end