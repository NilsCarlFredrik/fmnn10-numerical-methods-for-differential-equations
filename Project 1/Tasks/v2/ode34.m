function [t, u] = ode34(f, tspan, y0)
% ODE34 solver using adaptiveRKsolver2 and RK34step. 
% Made to use the same syntax as the built in solvers
% ode45 and ode15s

TOL = 10^-8;

[t, u] = adaptiveRKsolver2(@RK34step,f, y0, tspan,TOL);