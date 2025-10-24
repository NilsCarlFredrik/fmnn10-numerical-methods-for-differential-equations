%% General Values

y0 = 1;
t0 = 0;
tf = 0.6;
h = 0.1;

t = t0:h:tf;


lambda = -10;
f = @(t, y) lambda*y;
yreal = @(t) y0*exp(lambda*t);

%% calculates and approximated and real error as well as their difference
% Works as intended

[yout, errout] = RKsolver2(@RK34step, f, y0, t0, tf, h);
yout;
errout;

% calculates the difference 
errdiff = errout - (yout - yreal(t))
%error decreases with larger t -> RK34 converges

%% plots the error difference as a function of t skipping the inital value

plot (t(2:end), errdiff(2:end))

title('Difference of approximated RK34- and real error')
xlabel('t')
ylabel('Error difference')