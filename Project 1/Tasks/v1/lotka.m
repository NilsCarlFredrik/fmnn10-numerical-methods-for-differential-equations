function dudt = lotka(t, u) 
% numerical Lotka-Votera equation (Predator-Prey)
% 
%       x' = a*x - b*x*y
%       y' = c*x*y - d*y
% 

a = 3 ; 
b = 9 ; 
c = 15 ; 
d = 15 ; 

dudt = [u(1)*((a) - b*u(2)) ; -u(2)*(d - c*u(1))];

end