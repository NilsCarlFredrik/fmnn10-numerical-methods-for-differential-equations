function H = lotkaH(x,y)
% The H function for the lotka

a = 3 ; 
b = 9 ; 
c = 15 ; 
d = 15 ;

H = c*x + b*y - d*log(x) - a*log(y);


end