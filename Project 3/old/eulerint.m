function U = eulerint(Tdx, tf, U0xx, M)
% Solves, using eulerstep 
%       u. = Tdx*u
%
% Input:
%   Tdx:        Toeplitz matrix for d^2x/dx^2
%   tf:         Final time
%   U0x:        Initial function vector N x 1;
%   M:          Time steps

dt = tf/M;
U = [U0xx];
uold = U0xx;

for t = dt : dt : tf
    unew = eulerstep(Tdx, uold, dt);
    U = [U unew];
    uold = unew;
end

