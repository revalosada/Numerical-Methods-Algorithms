function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% falsePosition finds the root of a function using false position method
% User must input an anonymous function, a lower bracket, and an upper
% bracket at minimum.
% Outputs:
%       root: The independent variable value that will return approximately 0
%         fx: The value of the input function at the calculated root
%         ea: The approximate error of the calculated root
%       iter: The number of iterations used to calculate the root
% Inputs:
%       func: A user input function that a root needs to be found for
%         xl: Lower bracket
%         xu: Upper bracket
%         es: Desired maximum approximate error (defaults to .0001%)
%      maxit: Desired maxium tries at finding the root (defaults to 200)
% Created on: 10/5/2019
% Created by: Alex Losada
% Last modified: 10/5/2019

% check for correct number of arguments, and set defaults
if nargin < 3, error('function requires a minimum of 3 inputs, please see help file'), end
if nargin < 4, es = .0001; end
if nargin < 5, maxit = 200; end

% Test brackets
if xu < xl, error('bound order reversed, choose an xl that is lower than xu and try again.'), end
if func(xl)*func(xu) > 0, error('Chosen interval does not contain a root, choose different bounds.'), end
ea = 0;
iter = 1;
root = zeros(0,maxit);
while(1)
    root(iter) = xu-((func(xu)*(xu-xl))/(func(xu)-func(xl)));
    fx = func(root(iter));
    if func(root(iter))*func(xl) > 0
        xl = root(iter);
    else
        xu = root(iter);
    end
    if fx == 0
        break
    elseif iter == maxit
        break
    elseif iter > 1
        ea = abs((root(iter) - root(iter-1))/root(iter))*100;
        if ea <= es
           break 
        end
    end
    iter = iter+1;
end
root = root(iter);
end

