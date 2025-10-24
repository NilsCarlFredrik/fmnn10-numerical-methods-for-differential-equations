function unew = LaxWen(uold, amu)
% Takes a step using the Lax-Wendroff scheme for PDE
%   u.+au' = 0
%
% Input:
%   uold:   Previous function including endpoints (vector)
%   amu:    Constant (a*mu, a*dt/dx)
%
% Output:
%   unew:   New function (vector)


% creates tridagonal matrix
S = tridiag(length(uold),amu/2*(1+amu),1-amu^2,-amu/2*(1-amu)); 
% adds coefficients to S in order to make it periodic
S(1,end)=amu/2*(1+amu);
S(end,1)=-amu/2*(1-amu);
%calculates next step
unew = S*uold;




end