function U = stepInt(stepFunction, Tdx, tf, U0xx, M)
% Solves, using step function of choice 
%       u. = Tdx*u
%
% Input:
%   stepFunction:   Step function (e.g. eulerstep)
%   Tdx:            Toeplitz matrix for d^2x/dx^2
%   tf:             Final time
%   U0x:            Initial function vector N x 1;
%   M:              Time steps

dt = tf/M;
U = [U0xx];
uold = U0xx;

for t = dt : dt : tf
    unew = stepFunction(Tdx, uold, dt);
    U = [U unew];
    uold = unew;
end

