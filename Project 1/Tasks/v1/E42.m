%% options for odesolver
options = odeset('Stats','on')

%% general values

muvector = [10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000];

y0 = [2 0]';

%% Calculates function for each mu in muvector and prints time and statistics (including steps)
N = [];

for mu = muvector
    
    mu
    trange = [0, 2*mu];
    vdp = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)]; %van der Pol equation
    
    tic
    [t, y] = ode45(vdp, trange, y0, options);
    toc
    N = [N ; length(t')-1]

end

%% Plots a loglog diagram of N(mu)

N1 = [148, 295, 593, 1294, 2584, 5376, 11591, 26094, 55977, 125862, 255784, 534798, 1.1561e+06];

loglog(muvector, N, '-o')


title('Number of steps as a function of mu')
xlabel('mu')
ylabel('Steps')
grid on

%% Calculates rough estimations of q with N~C*,u^q

q = log(N1)./log(muvector) % q~2