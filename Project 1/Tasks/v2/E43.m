%% options for odesolver
options = odeset('Stats','on')

%% general values

muvector = [10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000];

y0 = [2 0]';

%% Calculates function for each mu in muvector and prints time and statistics (including steps)
N2 = [];
for mu = muvector
    
    mu
    trange = [0, 0.7*mu];
    vdp = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)]; %van der Pol equation
    
    tic
    [t, y] = ode15s(vdp, trange, y0, options);
    toc
    N2 = [N2; length(t')-1]

end

%% Plots a loglog diagram of N(mu) for both methods (using result from E42)

hold off
loglog(muvector, N, '-o')
hold on
loglog(muvector, N1, '-o')
loglog(muvector, N2, '-o')
title('Number of steps as a function of mu')
xlabel('mu')
ylabel('Steps')
grid on
legend('ODE34 TOL 1e-15','ODE34 TOL 1e-7', 'ODE15s')

%% Calculates function with large mu

mu = 1000000;
trange = [0, 0.7*mu];
vdp = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)]; %van der Pol equation

tic
[t, y] = ode15s(vdp, trange, y0, options);
toc
plot(t, y(:,2), 'o-');
% 45 steps, 4 ms
