%% General values (scalar)
y0 = 1;
t0 = 0;
tf = 0.6;
tspan = [t0 tf];
TOL = 10^-3;
k = 4;

% RHS and real function
lambda = -10;
f = @(t, y) lambda*y;
yreal = @(t) y0.*expm(lambda*t);


%% calculate numerical points (scalar)
[t, y] = ode34(f, tspan , y0);


%% calculate real points (scalar)
tr = t0:0.01:tf;
yrealarray = arrayfun(yreal, tr);

%% plot function (scalar)

scatter(t,y, 'r', 'o')
hold on
plot(tr, yrealarray, 'black')

title('Numerical and real solution adaptive RK34')
legend('Numerical','Real')
xlabel('t')
ylabel('y')
grid on
hold off
