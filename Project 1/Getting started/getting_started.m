%% 1.3

A = 5;
y0 = [2;1];
t0 = 0;
tf = 10;

errVHS(A, y0, t0, tf)

%% 1.4

A = 5;
y0 = 2;
t0 = 0;
tf = 10;
N = 20

[approx,err] = eulerint2(A, y0, t0, tf, N)