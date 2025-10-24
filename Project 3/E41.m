% Solves the viscous Burgers equation

tf = 1;
M = 1000;
dt = tf/M;
xf = 1;
N = 400;
dx = xf/N;

g = @(x) exp(-100.*(x-0.5).^2);

d = 0.001;

xx = linspace(0,xf,N+1);
tt = linspace(0,tf,M+1);
[T,X] = meshgrid(tt,xx);

U0xx = g(xx)';

uold = U0xx;
uold(end) = [];
U = [uold];
for t = dt : dt : tf
    unew = visBur(uold, d, dt);
    U = [U unew];
    uold = unew;
end
U = [U ; U(1,1:end)];

f2 = figure('position', [100,300,800,800]);
figure(f2)
mesh(T,X,U)
xlabel('t')
ylabel('x')
zlabel('u')
title('Numerical solution of Viscous Burgers')
%% animation
f2 = figure('position', [1000,300,800,800]);
figure(f2)
xlim([0 xf])
ylim([0 1])

for m = 1 : 1 : M
    plot(xx,U(1:end,m))
    ylim manual
    pause(0.01)
end