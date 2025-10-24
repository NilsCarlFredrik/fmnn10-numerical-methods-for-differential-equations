%% LaxWen

% unew = amu/2*(1+amu).*[uold(end);uold(1:end-1)] ...
%     +(1-amu^2).*uold(1:end)-amu/2*(1-amu).*[uold(2:end);uold(1)];



% unew = ((amu/2)*(1+amu)).*uold(1:end-1) ...
%     +(1-amu^2).*uold(2:end)-((amu/2)*(1-amu)).*[uold(3:end);uold(1)];
% 
% unew = [unew(end); unew];