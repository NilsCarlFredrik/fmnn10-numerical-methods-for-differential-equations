function fvec = fvectorize(f, N, L)
% Creates and returns a vector of values for interior points in f

dx = L/(N+1);
xvec = dx : L/(N+1) : L-dx;

fvec = arrayfun(f, xvec)';

end