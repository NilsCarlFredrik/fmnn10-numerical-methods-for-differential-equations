%% Test twopBVP

% set values and 
alpha = 2;
beta = 11;
N = 20;
L = 3;
xvec = 0 : L/(N+1) : L;             % creates a vector of values for x      
xvec2 =  0 : L/(N+1)/5 : L;         % creates a longer vector for a smoother real solution


f = @(x) 20*x.^3 - 42*x - 10;       % RHS
fvec = fvectorize(f,N,L);           % creates a vector of values for f


yreal = @(x) x.^5-7*x.^3-5*x.^2+2;  % Real
yvec = arrayfun(yreal,xvec2);        % creates a vector of real values

y = twopBVP(fvec,alpha,beta,L,N);   %calculates y

%% Test 2

% set values and functions
alpha = 1;
beta = 1;
N = 20;
L = 3*pi;
xvec = 0 : L/(N+1) : L;             % creates a vector of values for x      
xvec2 =  0 : L/(N+1)/5 : L;         % creates a longer vector for a smoother real solution

f = @(x) 4*x*cos(x)-(x^2-2)*sin(x);               % RHS
fvec = fvectorize(f,N,L);           % creates a vector of values for f

yreal = @(x) sin(x)*x^2 + 1;      % Real
yvec = arrayfun(yreal,xvec2);        % creates a vector of real values

y = twopBVP(fvec,alpha,beta,L,N);   % calculates y


%%  Plots numerical and real solutions

hold off
plot(xvec,y, '-o');
hold on
plot(xvec2,yvec);
grid on
legend('Numerical','Real')
% title('y1')
title('y2')
xlabel('x')
ylabel('y')
hold off

%% *******OLD******* calclates errors for N=10,20,40...5120
%  and saves middle global errors in vector errv as well as doing
%  a loglogplot forr err(x)

N = 10;
Nv = [];
errv = [];
err2 = [];
figure
hold off
for i=1 : 10
    xvec = 0 : L/(N+1) : L;
    fvec = fvectorize(f,N,L);
    yvec = arrayfun(yreal,xvec);
    
    y = twopBVP(fvec,alpha,beta,L,N);   % calculates y
    
    err =abs(yvec-y');                  % calculates global error
    err2 = [err2 rms(yvec-y')];
    errv = [errv ; abs(yvec(N/2)-(y(N/2))')];           % saves errors 
    hold on
    loglog(xvec,err);                   
    Nv = [Nv N];
    N = 2*N;                            
end

title('Global error for different values of N')
grid on
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
legend('N=' + string(Nv))
xlim([10^-1,10])
ylim([10^-6,1])

%% ******NEW UPTADED***** calclates RMS errors for N=10,20,40...5120
%  and does a loglog plot of it

N = 10;
Nv = [];
errv = [];

for i=1 : 10
    xvec = 0 : L/(N+1) : L;
    fvec = fvectorize(f,N,L);
    yvec = arrayfun(yreal,xvec);
    
    y = twopBVP(fvec,alpha,beta,L,N);   % calculates y
    
    rmserr = rms(yvec-y');              % calculate rms of err
    errv = [errv rmserr];               % adds it to a vector
    
    Nv = [Nv N];
    N = 2*N;                            
end

figure
loglog(Nv,errv, '-o');                        % plots rms err of N
grid on
legend('err of N');
title('RMS of errors for different values of N')
xlabel('N')
ylabel('err')




