function unew = LW(uold, dt, T, S)

U = uold;

unew = U - (dt).*U.*(S*U) + (dt^2/2).*((U.*(S*U).^2) + U.^2.*(T*U));


end