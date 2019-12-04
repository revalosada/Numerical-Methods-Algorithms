%Homework 12
%% #1

v0 = 55;
c = 15;
m = 80;
g = 9.81;

%First Iteration
syms f(t)
f(t) = v0*exp(-(c/m)*t) - (((m*g)/c) * (1 - exp(-(c/m)*t)));
d = diff(f);

f(4); 
fi = double(ans);
d(4);
df = double(ans);

root1 = 4 - (fi/df)

%Second Iteration:
f(root1);
fi = double(ans);
d(root1);
df = double(ans);

root2 = root1 - (fi/df)