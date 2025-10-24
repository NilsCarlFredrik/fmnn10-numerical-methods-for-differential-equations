% Solves, using eulers method:
%   u.=u''

% IC and BC
tf = 1;
ut0 = 0;
utL = 0;
u0x = @(x) x-x^5;

% Steps/grid
N = 200;    % Much tighter grid
M = 80;    % Much fewer steps
dx = 1/(N+1);
dt = tf/M;

C = (tf/M)/(1/(N+1)^2) % CLF condition.

% Toeplitx matrix for d^2x/dx^2
Tdx = (1/(dx^2)).*tridiag(N,1,-2,1);

% Ranges/mesh
xx = linspace(0,1,N+2);
tt = linspace(0,tf,M+1);
[T,X] = meshgrid(tt,xx);

% Create a vector of u0x
U0xx = arrayfun(u0x,xx)';
U0xx(1) = [];
U0xx(end) = [];


U = stepInt(@TRstep, Tdx, tf, U0xx, M);

U = [zeros(1,size(U,2)); U ; zeros(1,size(U,2))]; 

% Plot U
mesh(X,T,U)
xlabel('x')
ylabel('t')
zlabel('u')
set(gca,'Ydir','reverse')

%% Animation

f2 = figure('position', [1000,300,800,800]);
figure(f2)
xlim([0 xf])
ylim([0 1])

for m = 1 : 1 : M
    plot(xx,U(1:end,m))
    ylim manual
    pause(0.1)
end
 




