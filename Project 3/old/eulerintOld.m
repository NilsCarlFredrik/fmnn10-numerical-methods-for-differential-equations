function [approx,err] = eulerint(A, y0, t0, tf, N)
% Integrates
%   y' = Ay;    y(t0) = y0
% using N equal steps in the interval [t0, tf] and stores numerical
% endpoint value and error
%
%   A:      Constant/matrix
%   y0:     Initial value
%   t0:     Start point
%   t0:     Final point
%   N:      Number of steps

yreal = @(t) expm(A.*t).*y0;     % Real function

h = (tf-t0)/N;                  % Stepsize
uold = y0;                      % Initial value

for t=t0 : h : tf
    unew = eulerstep(A, uold, h);
    uold = unew;
end

real = yreal(tf)
approx = unew;
err = yreal(tf) - unew;

end