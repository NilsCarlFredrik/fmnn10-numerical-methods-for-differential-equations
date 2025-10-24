function [u, lambda] = EVPsolver(N, n)
%   Solver for EVP:
%
%   u''=lambda*u
%
%   with boundary values 0, u=[0,L]
% 
%   Au = lamda*u
%
%  A = tridiag(1,-2,1)
% 
% 
%   Returns:
% 
%   lamda:      diagonal matrix of eigenvalues
%   V:          matrix with columns of eigenvectors 
%   u:          first n eigenvectors with added boundary values  


dx = 1/(N+1);               % Crreate step size
D = tridiag(N,1,-2,1);      % Create diagonal matrix
T = (1/(dx^2)).*D;          % Create jacobian

[eF, eV] = eig(T);          % Finds eigenvectors/values

% Creates a matrix of eigenvectors of interest and their eigenvalues
u = [zeros(n,1) (eF(:,end-n+1:end))' zeros(n,1)];   
lambda = eV(end-n+1:end,end-n+1:end);



end