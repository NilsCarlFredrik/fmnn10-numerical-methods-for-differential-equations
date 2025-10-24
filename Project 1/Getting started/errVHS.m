function errVHS(A, y0, t0, tf)

%N = [2 2^2 2^3 2^4 2^5];
%H = (tf - t0)./N
N = [];
ERR = [];

pow0 = 5
powf = 25

for k=pow0 : 1 : powf
    N = [N 2^k]
    [approx, err] = eulerint(A, y0, t0, tf, N(k-pow0+1))
    ERR = [ERR err];
end

H = (tf - t0)./flip(N)
ERR
loglog(H, ERR)
grid on
end