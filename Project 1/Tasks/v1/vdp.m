function dudt = vdp(t, u) 
% numerical van der Pol equation.
%
%       x'' - mu*(1-x^2)*x' + x = 0
%
%  doesn't work in ode45

mu = 100;

dudt = [y(2); mu*(1-y(1)^2)*y(2) - y(1)];
end
