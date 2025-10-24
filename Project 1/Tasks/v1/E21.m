%% General Values

y0 = 1;
t0 = 0;
tf = 0.6;
h_a = 0.1;
h_b = 0.05;

ta = t0:h_a:tf;
tb = t0:h_b:tf;
t = t0:0.0001:tf;

lambda = -10;
f = @(t, y) lambda*y;
yreal = @(t) y0*exp(lambda*t);

%% calulates numerical and real points and errors

yout_a = RKsolver(@RK4step, f, y0, t0, tf, h_a);
yout_b = RKsolver(@RK4step, f, y0, t0, tf, h_b);

yrealarray_a = arrayfun(yreal, ta);
yrealarray_b = arrayfun(yreal, tb);

yrealarray = arrayfun(yreal, t);

erra = abs(yrealarray_a-yout_a)
errb = abs(yrealarray_b-yout_b);

%% plots numerical and real solutions

figure('Name','Numerical and real solution RK4','NumberTitle','off')
hold on

scatter(ta, yout_a, 'b');
scatter(tb, yout_b, 'r', '+');
plot(t, yrealarray, 'color', [0,0,0]+0.6);

xlabel('t');
ylabel('y')
title('Numerical and real solutions RK4')
legend('h=0.1','h=0.05','Real')
grid on
hold off


%% plots error in a log-log diagram

figure('Name','Error RK4','NumberTitle','off')
hold on

loglog(ta, abs(erra), 'r');
loglog(tb, abs(errb), 'b');
set(gca, 'XScale', 'log', 'YScale', 'log');

xlim([4*10^-2, 1])
xlabel('t')
ylabel('err')
title('Error RK4')
legend('h=0.1','h=0.05')
grid on
hold off

%% tests order

p = order(@RK4step) % p = 4













