function dy = HighGainObserver(t,X,sys,y,u,tspan,varargin)
u_=interp1(tspan,u,t);
y_=interp1(tspan,y(:,1),t);
extra_out=interp1(tspan,y(:,2),t);
x_hat1=X(1:sys.na);


dx_hat1=sys.A*x_hat1+sys.B*sys.f(x_hat1)+sys.bb*u_+sys.T*sys.K*(y_-sys.C*x_hat1)+sys.M*(extra_out-x_hat1(2));


t

if ~isempty(varargin)
dx_hat1=Proj(dx_hat1,varargin{1});
end
dy=dx_hat1;

end

