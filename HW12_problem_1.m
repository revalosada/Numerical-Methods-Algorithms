%HW12_problem_1

v0 = 55; c = 15; g = 9.81; m = 80;
f = @(t) v0*exp(-(c/m)*t)-((m*g)/c)*(1-exp(-(c/m)*t));
g = @(t) 107.32*exp(-0.1875*t)-52.32;
hold on
subplot(2,1,1), fplot(f);
subplot(2,1,2), fplot(g)
