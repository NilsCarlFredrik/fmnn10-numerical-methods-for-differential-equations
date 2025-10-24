%% General values (scalar)
y0 = 1;
t0 = 0;
tf = 0.6;
TOL = 10^-14;
k = 4;

% RHS and real function
lambda = -10;
f = @(t, y) lambda*y;
yreal = @(t) y0.*expm(lambda*t);


%% calculates and prints numerical solutions and their local errors

[yout, errout] = RKsolver2(@RK34step, f, y0, t0, tf, h);

%% Test newstep

err = errout(5);
errold = errout(6);
h = newstep(TOL, abs(err), abs(errold), h, k)
A = [TOL; err ; errold ; h ; k]
