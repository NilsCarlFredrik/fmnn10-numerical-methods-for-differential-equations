function hnew = newstep(TOL, err, errold, hold, k)
%   Computes and returns new h value with respect to tolerance, 
%   local error estimate, old error estimate, old stepsize and
%   order.
%
%   Input arguments:
%
%   TOL:        Tolerance
%   err:        Local error estimate
%   errold:     Previous error estimate
%   hold:       Old stepsize
%   k:          Order


hnew = (TOL/err).^(2/(3*k)) .* (TOL/errold).^(1/(-3*k)) .* hold;

