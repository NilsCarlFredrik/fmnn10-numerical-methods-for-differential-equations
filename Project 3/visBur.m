function unew = visBur(uold, d, dt, dx, T, S)



dx = 1/length(uold);

T = (1/dx^2).*tridiag(length(uold),1,-2,1);
S = (1/(2*dx)).*tridiag(length(uold),1,0,-1);

unew = (eye(length(uold)) - (d.*dt./2).*T)\ ...
    (LW(uold, dt, T, S) + (d*dt/2).*T*uold);
% implement LW

end