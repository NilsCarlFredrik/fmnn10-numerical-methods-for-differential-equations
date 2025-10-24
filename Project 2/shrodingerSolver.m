function [phi, E, p] = shrodingerSolver(V,N,n)
%   Solves stationary one dimensional schr?dinger equation and returns
%   the n:th first energy levels, wave functions together with their
%   probability density
% 
%           phi'' - V(x)*phi = -E*phi
% 
%   Range:  x = [0,1]
%   BV:     phi(0) = 0
%           phi(1) = 0
% 
%   With:
%        
%           (V - T)*Phi = E*Phi (to get E positive
% 
%   Input:
%   
%   V:          Potential function
%   N:          Number of steps
%   n:          Number of eigenfunctions and eigenvalues
%   
%   Output
% 
%   phi:        Wave functions
%   E:          Energy level (eigenvalues)
%   prob:       Probability density (|phi|^2)
% 

dx = 1/(N+1);                       % Create step size
xvec = dx : dx : 1-dx;              % Create x vector

D = tridiag(N,1,-2,1);              % Create diagonal matrix
T = (1/(dx^2)).*D;                  % 

VD = diag(arrayfun(V,xvec));        % Create diagonal matrix of V

[ef, ev] = eig(T-VD);                % Find eigenvalues and eigenvectors

%creates matrix of wavefunctions of interest
phi = [zeros(n,1) (ef(:,end-n+1:end))' zeros(n,1)]; 
%creates matrix of probability density functions of interest
p = abs(phi).^2;                               
% Creates matrix of eenergy levels of interest
E = -ev(end-n+1:end,end-n+1:end);    


end

















