%% general values and function 

mu = 100;
y0 = [2 0]';
trange = [0, 2*mu];

vdp = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)]; %van der Pol equation

%% solves vdp

[t, y] = ode15s(vdp, trange, y0);

%% plots y2(t)

hold off
plot(t, y(:,2), 'o-');

title('ODE15s van der Pol y2(t)')
xlabel('t')
ylabel('y2')
hold on

%% plots y2(y1)

hold off
plot(y(:,1), y(:,2));

title('ODE34 van der Pol y2(y1)')
xlabel('y1')
ylabel('y2')

hold on














