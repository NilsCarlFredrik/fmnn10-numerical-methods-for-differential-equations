function yout = RKsolver(RKstep, f, y0, t0, tf, h) 
%   Runge-Kutta solver for ODE:
%       
%       y' = f(t, y)
%
%   Using a Runge-Kutta single step function of choice.
%   
%   Returns a vector of sampled y values corresponding to the 
%   range t0-tf with step size h.
%
%   Input arguments:
%   
%   RKstep: Runge-Kutta stepfunction
%   f:      RHS function
%   y0:     Initial y value
%   to:     Initial t value
%   tf:     Final t value
%   h:      Step size

y = y0;
yout = y;

for t=t0 : h : tf-h
    
    y = RKstep(f, y, t, h);
    yout = [yout y];
    

end

end