% HW12_Problem_5

syms f(x)
f(x) = (-1.5*x^6)-(2*x^4)+(12*x);
dfdx = diff(f);
hold on
fplot(f);
% fplot(dfdx);
% xl = input('input lower bound');
% xu = input('input upper bound');
% m = bisect(dfdx,xl,xu,1);