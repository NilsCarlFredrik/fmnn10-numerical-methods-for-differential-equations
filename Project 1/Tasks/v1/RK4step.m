function unew = RK4step(f, uold, told, h)
% Takes a single classic RK4-step for ODE:
%       
%               y' = f(t, y)
%   
%   Input arguments:
%
%   f:      RHS function
%   uold:   Previous y value
%   told:   Previous t value
%   h:      Stepsize

t = told;
y = uold;

Y1 = f(t, y);
Y2 = f(t+h/2, y+h*Y1/2);
Y3 = f(t+h/2, y+h*Y2/2);
Y4 = f(t+h, y+h*Y3);

unew = y + h/6*(Y1 + 2*Y2 + 2*Y3 + Y4);

end