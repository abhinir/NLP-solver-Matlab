%% 
clc;
clear;
close all;
%% Initialization
optNLP = optimoptions('fmincon','Algorithm','sqp',...
    'MaxFunEvals',10000000,'MaxIterations',10000,'Display', 'iter-detailed',...
      'Diagnostics','on');

T = 25;
N = T*10;
dt = T/N;

int_type = 'euler'; % Choose 'RK45' or 'euler'
euler_steps = 100; % no. of euler steps from t to t+dt if int_type is euler

% Load model 
model = model_params('toy_rao');

% Initial guess
u_guess = normrnd(0,10,[model.nu,N]);

init_guess = propagate_states(model,u_guess,N,dt,euler_steps,int_type);
init_guess = [init_guess(:,2:end);u_guess];

% init_guess = dvarO;

%% Fmincon
problem = createOptimProblem('fmincon',...
    'objective',@(X)costfun(model,X,N,dt),...
    'x0',init_guess,'options',optNLP, ...
    'nonlcon',@(X) confun(model,X,N,dt,euler_steps,int_type));


[dvarO,JO,exitflag,output,lambda,grad,hessian] = fmincon(problem);


%% Plot

% plottrajectory(model,N,dt,dvarO)