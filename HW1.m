%HW1
%8/28/2019
%Alex Losada
%% Question 8
Tf = 32:3.6:93.2;
Tc = (5/9).*(Tf-32);
Rho = (5.5289e-8*(Tc.^3))-(8.5016e-6*(Tc.^2))+(6.5622e-5*Tc)+0.99987;
plot(Tc,Rho)
title('Density vs. Temperature');
xlabel('Degrees celsius');
ylabel('Density (g/cm^3)');
%% Question 9
q0 = 10; r = 60; L = 9; C = 0.00005;
t = linspace(0,0.8);
q = q0*(exp(-r*t/(2*L))).*cos(sqrt(1/(L*C)-((r/(2*L))^2)).*t);
plot(t,q); title('time vs. charge'); xlabel('time'); ylabel('charge');
%% Question 10
z = linspace(-5,5);
f = (1/sqrt(1/(2*pi)))*exp(-z.^2/2);
plot(z,f); title('Standard Normal Probability');
xlabel('Z'); ylabel('Frequency');

%%
hold on
Q = q0*exp(-r.*t/(2*L)).*cos(sqrt((1/L*C)-((r/(2*L))^2).*t));
q = q0*exp(-r.*t/(2*L)).*cos(sqrt(1/(L*C)-((r/(2*L))^2)).*t);
plot(t,Q)
plot(t,q)