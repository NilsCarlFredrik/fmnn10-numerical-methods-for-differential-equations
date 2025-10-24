function [tout, yout] = adaptiveRKsolver2(RKstep, f, y0, tspan, TOL) 
%   Adaptive Runge-Kutta solver for ODE:
%       
%       y' = f(t, y)
%
%   Using a Runge-Kutta singlestep function of choice (that includes 
%   local errorestimate) and newstep function.
%   
%   Returns a vector of sampled y values in the range t0-tf with 
%   corresponting t values.
%
%   Input arguments:
%   
%   RKstep: Runge-Kutta singlestep function
%   f:      RHS function
%   y0:     Initial y value
%   to:     Initial t value
%   tf:     Final t value
%   TOL:    Tolerance

% Set starting values
y = y0;
t = tspan(1);
k = 4;
h0 = abs(tspan(2)-tspan(1))*TOL^(1/4)/(100*(1+norm(f(tspan(1), y0))));
h = h0;
errold = TOL;

yout = y;
tout = t;
errout = errold;

%hvector = h0; %% temp for evaluation

while t < tspan(2)
    [y, err] = RKstep(f, y, t, h);
    
    h = newstep(TOL, err, errold, h, k);
    %hvector = [hvector h]; %% temp for evaluation
   
    tout = [tout t];
    yout = [yout y];
    
    errold = err;
    t = t + h;
   
    %errout = [errout err]; %% temp for evaluation

    
end

% Add last values for y and t
h = tspan(2) - t;
t = tspan(2);
[y, err_] = RKstep(f, y, t, h);
yout = ([yout y])';
tout = [tout t];

%errout = [errout err_]  %% temp for evaluation
%hvector = [hvector h] %% temp for evaluation

%plot(tout, errout); %% temp for evaluation

end