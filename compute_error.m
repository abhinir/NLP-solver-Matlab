function err = compute_error(model,x,N)

modelName = model.name;
if strcmp(modelName,'car')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'pendulum')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'cartpole')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'unicycle')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'softLand')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'att_con')
    err = x - model.xf.*ones(model.nx,N+1);
elseif strcmp(modelName,'toy_rao')
    err = x;
    err(:,end) = x(:,end) - model.xf;
end


end