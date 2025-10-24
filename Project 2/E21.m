%% General values and functions
N = 499;
dx = 1/(N+1);
xvec = 0 : dx : 1;
n = 3;


[u ,lambda] = EVPsolver(N, n);
lambdavec = flip(diag(lambda)')

urreal = @(n, x) sin((1:n).*pi.*x');
lambdareal = @(n) -((1:n).^2)*(pi^2);

ur = urreal(n,xvec);
lambdar = lambdareal(n)

% flips the numerical eigenfunctions to match real solution
u(3,:) = -u(3,:);
u(2,:) = -u(2,:);

%% calculates and plots first three eigenvalues for different N
N=4;
Nvec = [];
n=3;
lambdavector = [];

for i=1 : 1 : 10
    
    [u ,lambda] = EVPsolver(N, n);
    lambdar = lambdareal(n);
    lambdavec = flip(diag(lambda)');
    
    lambdavector = [lambdavector; lambdavec-lambdar];
    Nvec = [Nvec ; N];
    
    N = 2*N+1;
    
end

loglog(Nvec,lambdavector)
legend();
title('Errors for eigenvalues in relation to number of steps');
xlabel('N')
ylabel('error')
grid on
%% Plots the functions and eigenfunction

figure
plot(xvec,ur);
title('Real eigenfunctions')
xlabel('x')
ylabel('u')
grid on

figure
plot(xvec,u);
title('Numerical eigenfunctions')
xlabel('x')
ylabel('u')
grid on


%%











