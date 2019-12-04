function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin ~= 2
    error('incorrect number of input arguments, please specify size of desired matrix, n x m')
else
    A = zeros(n,m);

    for i = 1:m
        A(1,i) = i;
        for j = 2:n
            if i == 1
                A(j,1) = j;
            elseif i ~= 1
                for k = 2:n
                    A(k,i) = A(k,i-1) + A(k-1,i);
                end
            end
        end
    end
end
% Now the real challenge is to fill in the correct values of A


end
% Things beyond here are outside of your function
