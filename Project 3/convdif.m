function unew = convdif(uold, a , d, dt)






dx = 1/length(uold); 

sub = d/dx^2 + a/(2*dx);
main = -2*d/dx^2;
sup = d/dx^2 - a/(2*dx);

A = tridiag(length(uold), sub, main, sup);

A(1,end) = sub;
A(end,1) = sup;

unew = ((eye(length(uold)) - (dt/2).*A) ...
    \(eye(length(uold)) + (dt/2).*A))*uold;


end