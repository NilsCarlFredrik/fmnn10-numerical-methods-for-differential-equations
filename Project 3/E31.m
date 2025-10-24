% solves  a convection-diffusion equation


tf = 1;
M = 100;
dt = tf/M;
xf = 1;
N = 500;
dx = xf/N;

g = @(x) exp(-100.*(x-0.5).^2);
% g = @(x) 1-abs((x-1/2))

a = 1;
d = 0.1;
P = abs(a/d)


xx = linspace(0,xf,N+1);
tt = linspace(0,tf,M+1);
[T,X] = meshgrid(tt,xx);

U0xx = g(xx)';

uold = U0xx;
uold(end) = [];
U = [uold];
for t = dt : dt : tf
    unew = convdif(uold, a, d, dt);
    U = [U unew];
    uold = unew;
end
U = [U ; U(1,1:end)];


f1 = figure('position', [30,30,600,600]);
figure(f1)
mesh(T,X,U)
xlabel('t')
ylabel('x')
zlabel('u')
title('Numerical solution')

%% animation

f2 = figure('position', [200,200,600,600]);
figure(f2)
xlim([0 xf])
ylim([0 1])

for m = 1 : 1 : M
    plot(xx,U(1:end,m))
    ylim manual
    pause(0.03)
end
 