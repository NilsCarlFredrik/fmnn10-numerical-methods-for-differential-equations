function yout = RK4(f, y0, t0, tf, h) 
%   Classic RK4 solver for ODE:
%       
%       y' = f(t, y)
%
%   Returns a vector of sampled y values corresponding to the 
%   range t0-tf with step size h.
%
%   Input arguments:
%   
%   f:      RHS function
%   y0:     Initial function value
%   to:     Initial t value
%   tf:     Final t value
%   h:      Step size

y = y0;
yout = y;

for t=t0 : h : tf-h
    
    Y1 = f(t, y);
    Y2 = f(t+h/2, y+h*Y1/2);
    Y3 = f(t+h/2, y+h*Y2/2);
    Y4 = f(t+h, y+h*Y3);
    
    y = y + h/6*(Y1 + 2*Y2 + 2*Y3 + Y4);
    yout = [yout  y];
end

end