% Calculates and prints errors for a range of h in a loglog plot

y0 = 1;
t0 = 0;
tf = 0.6;
h = 0.1;
hr = [];

lambda = -10;
f = @(t, y) lambda*y;
yreal = @(t) y0*exp(lambda*t);

errav = [];


figure('Name','Error RK4','NumberTitle','off')
hold off
hold on
for i=1 : 10
    
    t = t0:h:tf;

    yout = RKsolver(@RK4step, f, y0, t0, tf, h);
    yrealarray = arrayfun(yreal, t);
    
    err = abs(yrealarray-yout);
    loglog(t, err, '-');  
    
    hr = [hr h];
    h = h/2;

    errav = [errav; mean(err)];
end

set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([10^-1, 1])
xlabel('t')
ylabel('err')
title('Error RK4')
legend('h=' + string(hr))
grid on
hold off
