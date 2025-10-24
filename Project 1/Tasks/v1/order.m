function p = order(RKstep)
% A function that tests the order of a Runge-Kutta method by running a
% simple ODE that is only dependant on t.
% 
%   Input arguments:
% 
%   RKstep:     Runge-Kutta stepfunction
% 

f = @(t,y) 1/(1+t)^2;
yreal = 0.5;
t0 = 0;
tf = 1;
y0 = 0;

h = 0.1;
y=RKsolver(RKstep, f, y0, t0, tf, h);
ya = y(end);

h = 0.05;
y=RKsolver(RKstep, f, y0, t0, tf, h);
yb = y(end);

ratio = (ya - yreal)/(yb - yreal);
p = round(log2(ratio));


