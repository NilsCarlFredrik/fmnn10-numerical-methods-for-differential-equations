%   Solves and plots wave functions and probability densities for
%   stationary schrodinger with different potentials
%

N = 499;
dx = 1/(N+1);
xvec = 0 : dx : 1;
n = 8;
% V = @(x) 0;
% V = @(x) 800*sin(pi*x)^2;
% V = @(x) 600*(heaviside(-0.1+x)-heaviside(-0.2+x)+heaviside(-0.4+x)-heaviside(-0.6+x)+heaviside(-0.8+x)-heaviside(-0.9+x));
% 
x1 = 0.3;
x2 = 0.5;
x3 = 0.7;
V = @(x) 700/(x2-x1)*((x-x1)*(heaviside(x-x1)-heaviside(x-x2))-(x-x3)*(heaviside(x-x2)-heaviside(x-x3)))

[u ,lambda,p] = shrodingerSolver(V,N,n);
lambdavec = diag(lambda);

% Creates labels for legend
phistr = [];
pstr = [];
for i=0 : 1 : n-1
    phistr = [phistr 'Phi'+string(n-i)];
%     estr = [estr 'E'+string(i)];
    pstr = [pstr 'P'+string(n-i)];
end

% Plots wavefunctions on energylevels and potential
figure('position',[0,0,500,1100])
plot(xvec,arrayfun(V,xvec), '--', 'color', 'black')
hold on
plot(xvec,20*u(1,:)./max(u(1,:))+lambdavec(1), 'linewidth', 1.5) %add first vector cause next line don't for some reason
plot(xvec,20*u./(flip(max(u'))')+lambdavec, 'linewidth', 1.5)
plot(xvec,ones(size(xvec)).*lambdavec, '--', 'color', 0.7*[0.6 0.6 1], 'linewidth', 0.1)
legend(['V' phistr 'E levels'])
xlabel('x')
ylabel('phi, E')
hold off

% Plots probability densities on energylevels and potential
figure('position',[600,0,500,1100])
plot(xvec,arrayfun(V,xvec), '--', 'color', 'black')
hold on
plot(xvec,20*p./(flip(max(p'))')+lambdavec, 'linewidth', 1.5)
plot(xvec,ones(size(xvec)).*lambdavec, '--', 'color', 0.7*[0.6 0.6 1], 'linewidth', 0.1)
legend(['V' phistr 'E levels'])
xlabel('x')
ylabel('p, E')
hold off
