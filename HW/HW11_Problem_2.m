% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;
format long
% Define the function to be solved for. Is the angle specified in radians or degrees?
f = @(x)((mu*m*g)./(cosd(x)+mu*sind(x)))-150;
% THINK, what makes range sense for angle?
x = linspace(0,90,1000);
y = f(x);
% Plot your function. Does plotting give you an idea about where the root is?
plot(x,y)
% Finaly solve for the root using the bisection script given to you, which can be called as:
[root, fx, ea, iter] = bisect(f,60,70);
fprintf('root is %e\nfunction value is %e\napproximate error is %e\nnumber of iterations is %d',root,fx,ea,iter)


% These variables will be checked for your final answer:
%angle =  % the angle in degree that solves this problem
%fx =     % the function value at your solved angle
%ea =     % the bisection error estimate
%iter =   % the number of bisection iterations