function [unew, errnew] = RK34step(f, uold, told, h)
%   Takes a single RK34 step and stores result in *unew* and uses
%   embedded RK3 to compute and stores local error estimate in *errnew*
%
%   Input arguments:
%
%   f:      RHS function
%   uold:   Previous y value
%   told:   Previous t value
%   h:      Step size
%
%

t = told;
y = uold;

Y1 = f(t, y);
Y2 = f(t+h/2, y+h*Y1/2);
Y3 = f(t+h/2, y+h*Y2/2);
Y4 = f(t+h, y+h*Y3);

Z3 = f(t+h, y-h*Y1+2*h*Y2);

unew = y + h/6*(Y1 + 2*Y2 + 2*Y3 + Y4);
errnew = norm(h/6*(2*Y2 + Z3 - 2*Y3 - Y4));


end