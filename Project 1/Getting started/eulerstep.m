function unew = eulerstep(A, uold, h)
% Takes an eulerstep for an ode:
%   y' = Ay,   y(t0) = y0
%
%   A:      Constant/matrix
%   uold:   Previous function value
%   h:      Stepsize

s = A.*uold;
unew = uold +h.*s;
    
end