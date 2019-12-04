function [nd] = days(mo,da,leap)
% days: input date, output number of days that have passed this year
%   output: nd (number of days that have passed this year)
%   inputs:
%         mo (numerical input corresponding to the month of the year)
%         da (numerical input corresponding to the day of the month)
%         leap (numerical input 1 = leap year (366 days), 0 = normal year
%         (365 days))
% Created on: 9/10/2019
% Created by: Alex Losada
% Last modified: 9/10/2019

mo_days = [31 1 31 30 31 30 31 31 30 31 30 31]; %initialize number of days per month

% Set error conditions
if nargin < 2
    error('please enter a month and a day')
elseif nargin == 2
    leap = 0;
end

if mo > 12 || mo < 1
    error('please enter a valid month, between 1 and 12')
elseif da > 31 || da < 1
    error('Please enter a valid day, between 1 and 31')
elseif leap ~= 1 && leap ~= 0 
    error('please enter a valid input for leap year, 1 = leap year, 0 = normal year')
end

%set conditions for leap year
if leap == 1
    mo_days(2) = 29; %set Feb to 29 days
else
    mo_days(2) = 28; %set Feb to 28 days
end
mo_in = mo-1; %set index to sum number of days in completed months
nd_mo = sum(mo_days(1:mo_in)); % sum number of days in completed months
  
nd = nd_mo + da; %sum number of days of completed months plus days into current month
end

