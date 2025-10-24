function U = stepInt2(stepFunction, amu, tf, U0xx, M)
% Solves, using step function of choice 
%       u.+au' = 0
%
% Input:
%   stepFunction:   Step function (LaxWen)
%   amu:            Constant (a*mu, a*dt/dx)
%   tf:             Final time
%   U0x:            Initial function vector N x 1;
%   M:              Time steps

dt = tf/M;
U = [U0xx];
uold = U0xx;

for t = dt : dt : tf
    unew = stepFunction(uold, amu);
    U = [U unew];
    uold = unew;
end

