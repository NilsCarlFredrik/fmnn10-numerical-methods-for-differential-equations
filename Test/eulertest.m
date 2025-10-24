


function eulertest(alpha, u0, t0, tf)   % Test of explicit Euler method. Written (c) 2017-09-06

for k = 1:4
    N = 10^(5-k);                       % Number of steps
    dt = (tf-t0)/N;                     % Time step
    u = u0;                             % Initial value
    t = t0; 
    sol = u;
    time = t;
    err = 0;
    
    for i=1:N                           % Time stepping loop
        u = u + dt*alpha*u;             % A forward Euler step
        t = t + dt;                     % Update time
        sol = [sol u];                  % Collect solution data
        time = [time t]; 
    end
    
    uexact = exp(alpha*(time - t0))*u0; % Exact solution
    error = sol - uexact;               % Numerical error
    h(k) = dt;                          % Save step size
    r(k) = abs(error(end));             % Save endpoint error
    
    figure(1)
    subplot(2,1,1) 
    plot(time,sol,'r')                  % Numerical solution (red)
    hold on 
    plot(time,uexact,'b')               % Exact solution (blue)
    grid on 
    axis([0 1 0.3 1]) 
    xlabel('t') 
    ylabel('u(t)') 
    hold off
    
    subplot(2,1,2) 
    semilogy(time,abs(error))           % Error vs. time
    grid on 
    hold on 
    axis([0 1 1e-6 1e-1]) 
    xlabel('t') 
    ylabel('error')
end

figure(2) 
loglog(h,r,'b')                         % Endpoint error vs dt
xlabel('dt') 
ylabel('error') 
grid on 
hold on 
xref = [1e-4 1e-1]; 
yref = [1e-5 1e-2]; 
loglog(xref,yref,'k--') 
hold off







