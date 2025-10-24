%% options for odesolver
options = odeset('Stats','on')

%% general values

muvector = [10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000];

y0 = [2 0]';

%% Calculates function for each mu in muvector and prints time taken. Saves number of steps in vector N
N = [];
for mu = muvector
    
    mu
    trange = [0, 0.7*mu];
    vdp = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)]; %van der Pol equation
    
    tic
    [t, y] = ode34(vdp, trange, y0);
    N = [N;length(t') - 1]; %number of steps
    toc
    
    figure
    legend
    plot(t, y(:,2), 'o-');

end

%% Plots a loglog diagram of N(mu)
figure
loglog(muvector, N, '-o')


title('Number of steps as a function of mu')
xlabel('mu')
ylabel('Steps')
grid on

