%% General Values

y0 = 1;
t0 = 0;
tf = 1;
h = 0.1;

t = t0:h:tf;


lambda = 1;
f = @(t, y) lambda*y;
yreal = @(t) y0*exp(lambda*t);

%% 2.1
% calulates numerical and real points

yout = RKsolver(@RK4step, f, y0, t0, tf, h);
yrealarray = arrayfun(yreal, t);

%% plots numerical and real solutions

hold on
plot(t, yout, 'r');
plot(t, yrealarray, 'b');
grid on
hold off

%% plots error in a log-log diagram

hold on
loglog(t, abs(yrealarray-yout))
grid on
hold off

%% 2.2
%calculates and prints numerical solutions and their local errors

[yout, errout] = RKsolver2(@RK34step, f, y0, t0, tf, h);
yout
errout

%% general values for 2.3-2.4 (scalar)
y0 = 1;
t0 = 0;
tf = 1;
TOL = 10^-14;
k = 4;

% RHS and real function
lambda = 1;
f = @(t, y) lambda*y;
yreal = @(t) y0.*expm(lambda*t);



%% general values for 2.3-2.4 (matrix)
y0 = [1 1];
t0 = 0;
tf = 1;
TOL = 10^-14;
k = 4;

% RHS and real function
lambda = [-1 10; 0 -3];
f = @(t, y) [y(1) y(2)]*lambda;
yreal = @(t) expm(lambda.*t).*y0;


%% 2.3

err = errout(6);
errold = errout(7);
h = newstep(TOL, abs(err), abs(errold), h, k)
A = [TOL; err ; errold ; h ; k]


%% 2.4

%% calculate numerical and real points (scalar)
[y, t] = adaptiveRKsolver(@RK34step, f, y0, t0, tf, TOL);


tr = t0:0.1:tf;
yrealarray = arrayfun(yreal, tr);

%% calculate numerical and real points (matrix)
[y, t] = adaptiveRKsolver(@RK34step, f, y0, t0, tf, TOL);


tr = t0:0.1:tf;
%yrealarray = arrayfun(yreal[1]), tr);

%% plot function

hold on
plot(t,y, 'r')
plot(tr, yrealarray, 'b')
hold off
%% 3.1




%% 4.1




%% 4.2 



%% 4.3






























