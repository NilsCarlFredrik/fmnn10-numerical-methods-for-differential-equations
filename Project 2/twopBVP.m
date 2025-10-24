function y = twopBVP(fvec, alpha, beta, L, N)
% Solves for y:
%
%   y''(x, y) = f(x) ; x = [0,L]
% 
%   Using:
%   
%   1/dx^2 * Ay = X + f
%
%   where 
%   
%   X = [-alpha/dx^2; 0 ... 0; -beta/dx^2]
%
%
%   Inputs:
% 
%   fvec:       discrete vector of f values
%   alpha:      y(0)
%   beta:       y(L)
%   L:          endpoint
%   N:          Number of steps (excluding boundarys)
% 
%   Output:
% 
%   y:          a vector of numerical values for solution

dx = L/(N+1);                                   % stepsize
A = tridiag(N,1,-2,1);                          % creates matrix A
X = [-alpha/dx^2 ;zeros(N-2,1); -beta/dx^2];    % creates vector X

y = (dx^2)*(A\(X + fvec));                      % solves equation
y = [alpha; y; beta];                           % adds initual values to y


end