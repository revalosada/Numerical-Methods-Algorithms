function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
L = eye(size(A));% Initialize L matrix
U = A;%Initialize U matrix
P = eye(size(A));%Initialize P matrix
dim = size(A);% Get A matrix size
if dim(1) ~= dim(2), error('Please enter a square matrix');%error check for non square matrix
else, dim  = dim(1);% set counter for loop
end
for i = 1:(dim-1) %Start U and L Matrix creation, i indexes columns in most cases
    j = i; %Initialize j value, indexes rows for most cases
    [~,n] = max(abs(U(:,i))); % find the row with the max absolute value in the current working column
    if U(i,i) == 0, n = i+1; end %Force row swap if current position is 0
    if n >= i % conditional statement to ensure that if n value is less than the current working column, rows don't get swapped.
        ptemp = P(i,:); P(i,:) = P(n,:); P(n,:) = ptemp;% swap permutation rows
        temp = U(i,:); %store current row in a temporary variable
        U(i,:) = U(n,:);%swap current row with max value row
        U(n,:) = temp;% swap max row with current row
        if i == 1
        else
            Ltemp = L(i,1:i-1); %temporarily store values from all previous columns in the current row
            L(i,1:i-1) = L(n,1:i-1); %swap current row with values from U max row in all previous columns
            L(n,1:i-1) = Ltemp; %swap U max row with values from the current row, all previous columns.
        end
    end
while(1)% begin setting up L matrix, and elminating coefficients from U matrix
    if U(i,i) == 0, break, end %if the forced swap swaps in a 0, this code prevents division by 0
 L(j+1,i) = U(j+1,i)/U(i,i); %input L matrix value
 t = U(i,:)*L(j+1,i);% create temporary row vector for subtraction from U matrix
 U(j+1,:) = U(j+1,:)-t; %zero the coefficient in the next row, current column
 if j == dim-1, break, end %exit loop after the last needed subtraction has been completed
 j = j+1;
end
end
end