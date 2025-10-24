%% Solve The Beam Equation
%   M'' = q(x)
%   u'' = M/(EI)

format long;                                    % Display more digits

% Set general given values
alpha = 0;
beta = 0;
L = 10;
N = 999;
xvec = 0 : L/(N+1) : L;

% M
q = -50*(10^3);                                 % [N/m]
qvec = ones(N,1).*q;                            % Create vector of q

M = twopBVP(qvec,alpha,beta,L,N);               %Calculate M [Nm]
% Removes boundary values from M since we don't want them in the following
% functions
M(1) = [];
M(length(M'))=[];

% u
E = 1.9*(10^11);                                % [N/m^2]
I = @(x) (10^-3)*(3-2*(cos((pi*x)/L))^(12));    % [1]
Ivec = fvectorize(I,N,L);                       % Create vector of I
fvec = M./(E*Ivec);                             % Simplify our rhs

u = twopBVP(fvec,alpha,beta,L,N);               % Calculate u [m]
u = u.*(10^3);                                  % Change unit [mm]

plot(xvec,u)
grid on
title('Centerline deflection u(x)')
xlabel('x [m]')
ylabel('u [mm]')


u(501)  %-11.741059 [mm]



