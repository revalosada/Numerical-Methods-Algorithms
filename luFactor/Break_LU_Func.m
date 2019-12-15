for i = 1:100000
M = randi(100);
A = randi(100,M);
[l,u,p] = luFactor(A);
B = l*u;
C = p*A;
if B ~= C, error('Now You Fucked Up'), end
end