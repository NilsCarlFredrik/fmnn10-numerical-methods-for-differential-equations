function unew = TRstep(Tdx, uold, dt)
% Takes a Crank-Nicoloson step for pde 
%   u.=Tdx*u 
%
% Input:
%   Tdx:    Toeplitz matrix
%   uold:   Previous function (vector)
%   dt:     Stepsize
% 
% Output:
%   unew:   New function (vector)

unew = (eye(length(Tdx))-(dt/2.*Tdx))\(eye(length(Tdx))+(dt/2.*Tdx))*uold;