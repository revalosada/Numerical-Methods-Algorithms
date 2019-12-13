%% HW3
% Alex Losada
% Mech 105

% Specify the variables needed to solve this problem (ie. height of each section, diameter, radiaus, ...)
%   It is alwasy easier to work with variables (diameter_cyl = 25) than to use numbers everywhere, since a 
%   diameter indicates something specific but the number 25 could mean anything


% Specify the height of the water
h = input('Enter height ');
rad1 = 25/2;
format long
vmax = 9.326603190344698e+03;
% You can comment / uncomment lines below for testing. This will overwrite the previous line for h = 20.
% For submission, make sure all of the following lines are commented out and h = 20! (OR IT IS MARKED AS WRONG)
%h = 5
%h = 19
%h = 47
%h = -1

% Now compute the volume. Using conditional statments you will want to first check the height makes sense,
% and then solve the volume depending on what portion of the tank has been filled.
% Make sure that your volume is stored in the variable v! (OR IT WILL BE MARKED AS WRONG)
% You may find it more convenient to move v around in you code, it is only given here to indicate what variable to use.
if h > 33 || h <= 0
    error('Height entered must be greater than 0 and less than 33')
elseif h <= 19
    v = (pi*rad1^2)*h;
else
    v = vmax + pi*(((9/48)*(h-19)^3)+(9.375*(h-19)^2)+(156.25*(h-19)));
end
fprintf('The volume of the cylinder is %0.2f \n',v)