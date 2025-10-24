function unew = eulerStep(Tdx, uold, dt)
% Takes an eulerstep for a pde:
%   u.=Tdx*u 
%
% Input:
%   Tdx:    Toeplitz matrix
%   uold:   Previous function (vector)
%   dt:     Stepsize
% 
% Output:
%   unew:   New function (vector)

unew = uold + dt.*(Tdx*uold);
    
end



