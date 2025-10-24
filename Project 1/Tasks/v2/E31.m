%% set range and initial conditions for balanced system

tspan = [0 10];
y0 = [1, 1]';

%% set range and initial conditions for excess of rabbits

tspan = [0 100];
y0 = [10, 1]';

%% set range and initial conditions for excess of wolves

tspan = [0 500];
y0 = [1, 100]';

%% set values for long integration

tspan = [0 1000];
y0 = [1, 1]';

%% calculate numerical function values

[t, u] = ode34(@lotka, tspan, y0);

x = [u(:,1)]; % Rabbits
y = [u(:,2)]; % Wolves

%% plots u(t)


hold off
plot(t, x, 'x-', 'Color', 'b') % Rabbits
hold on
plot(t, y, 'x-', 'Color', 'r') % Wolves

title('Lotka-Voltera balanced system 1:1')
% title('Lotka-Voltera excess of rabbits 100:1')
% title('Lotka-Voltera excess of wolves 100:1')
legend('Rabbits', 'Wolves')
% ylim([0,2])
% xlim([490,500])
xlabel('Generation')
ylabel('Population')
grid on
hold off

%% plots y(x)


hold off
scatter(x(1),y(1), 'r')
hold on
plot(x,y, 'color', [0.5,0.5,1])

title('Wolves as a function of rabbits')
legend('Starting point')
xlabel('Rabbits')
ylabel('Wolves')
% xlim([0.4,1.9])
% ylim([0,1.1])
hold off

%% animates the y(x) plot

h = animatedline;
xlabel('Rabbits')
ylabel('Wolves')
xlim([0,2])
ylim([0,1.5])

for k = 1:length(x)
    pause(0.001)
    addpoints(h,x(k),y(k));
    drawnow
end

%% calculates and plots lotkaH

H = lotkaH(x,y);

H2 = abs(H./H(1)-1);

hold off
semilogx(t, H2)
title('Change of H over time')
grid on
xlabel('t')
ylabel('H')
% semilogx(t, H2)
% loglog(t,H2)


