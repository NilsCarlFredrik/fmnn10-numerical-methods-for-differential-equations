function A = tridiag(N, sub, main, sup)
%   Creates and returns a NxN tridiagonal matrix: 
%
%   main    sup     0       0       . .     0
%   sub     main    sup     0       . .     0
%   0       sub     main    sup     . .     0
%   0       0       sub     main    . .     0
%   .       .       .       .      .
%   .       .       .       .         .     sup
%   0       0       0       0         sub   main
% 

sub = repmat(sub, [1, N-1]);            % Creates repetative
main = repmat(main, [1,N]);             % vectors from our values
sup = repmat(sup, [1,N-1]);

% Uses the vectors create the tridiag matrix
A = diag(sub,-1) + diag(main,0) + diag(sup,1);      

end