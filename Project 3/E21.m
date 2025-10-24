% Solves, using Lax-Wendrof method, the advecation equation
% u.+au'=0


tf=5;
M= 1000;
dt=tf/M;
xf=1;
N=200;
dx = xf/N;
g = @(x) exp(-100.*(x-0.5).^2);

a = -0.5;
amu=a*dt/dx %stable if amu<=1

ureal = @(x,t) exp(-100.*(mod(x-a.*t,xf)-0.5).^2);


xx = linspace(0,xf,N+1);
tt = linspace(0,tf,M+1);
[T,X] = meshgrid(tt,xx);

U0xx = g(xx)';

uold = U0xx;
uold(end) = [];
U = [uold];
for t = dt : dt : tf
    unew = LaxWen(uold, amu);
    U = [U unew];
    uold = unew;
end
U = [U ; U(1,1:end)];

%% PLots

f1 = figure('position', [10,10,960,500]);
figure(f1)
mesh(T,X,U)
xlabel('dt')
ylabel('dx')
zlabel('u')
title('Numerical solution, amu = ' + string(amu))
%%
f2 = figure('position', [10,600,960,500]);
figure(f2)
mesh(T,X,ureal(X,T))
xlabel('t')
ylabel('x')
zlabel('u')
title('Real solution')
%%
f3 = figure('position', [1000,10,960,500]);
figure(f3)
loglog(tt,rms(ureal(X,T)-U))
xlabel('t')
ylabel('err')
title('RMS error')
grid on

f4 = figure('position', [1000,600,960,500]);
figure(f4)
plot(xx,U(1:end,end)')
title('numerical u(x,tf)')
grid on

%% Animation
f5 = figure('position', [600, 200, 800, 800])
figure(f5)
xlim([0 xf])
ylim([0 1])

for m = 1 : 1 : M
    plot(xx,U(1:end,m))
    ylim manual
    pause(0.01)
end