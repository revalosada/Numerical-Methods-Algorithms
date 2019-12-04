function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%error checks
if nargin < 2, error('must input 2 arguments')
elseif numel(x) ~= numel(y), error('size of input vectors must be the same')
elseif numel(x) == 1, error('Inputs must be linear arrays of size 2, minimum')
end
iter = 1;
n = numel(x)-1;%set number of intervals 
while(1) %interval size check
    if iter == n-1 || numel(x) == 2, break, end
    if x(iter+1)-x(iter) ~= x(iter+2)-x(iter+1)
        error('interval sizes vary, please check data and re-enter.')
    end
    iter = iter+1;
end
i = 1;%initiate while loop iteration start value
h = (x(end)- x(1))/(n);%set rectangle width for trap rule
if (numel(x)-1)/2 ~= floor((numel(x)-1)/2) || numel(x) == 2%conditional to use trapezoid rule
    warning('An instance of trapezoid rule must be used to complete integral')
    trapezoid = ((y(end-1)+y(end))/2)*h;%find area of last trapezoid
    n = n-1;%exclude last entry
else
    trapezoid = 0; %set trapezoid to zero if no trapezoid rule is needed
end
if numel(x) > 2 %Conditional to start cumulative simpson rule
h = h/3; %reset h value to be used as coefficient on cumulative simpsons
iter = i;
begin = y(iter);%first function value
finish = y(n+1);%Last function value
odds = 0;
while(1) % calculate values of odd indices
    if iter == n+1, iter = i; break, end
    odd = y(iter+1);
    odds = odds + odd;
    iter = iter +2;
end
evens = 0;
while(1) %calculate value of even indices
    if iter == n-1, break, end
    even = y(iter+2);
    evens = evens + even;
    iter = iter +2;
end
   I = h*(begin + 4*odds + 2*evens + finish) + trapezoid; %sum all parts
else
    I = trapezoid;
end
end