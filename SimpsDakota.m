function [I] = SimpsDakota(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

Z=length(x);
l=Z-1;
if length(x)~=length(y)
    error('must be same size')
end

check=linspace(x(1),x(Z),Z);
if isequal(x,check)==0
    error('Segment must be equal')
end

if mod(l,2)==0
    t=3;
    Int_1=0;
    while t<=l-1
        Int_1=Int_1+y(t);
        t=t+2;
    end
   
    k=2;
    Int_2=0;
    while k<=l
   Int_2=Int_2+y(k);
   k=k+2;
    end
   
 if Z > 2, stepsize =(x(Z)-x(1))/(Z-1);
 else; stepsize = x(2) - x(1);
 end
I=stepsize*(y(1)+(4*Int_2)+(2*Int_1)+y(Z))/3;
else
    Int_1=0;
    t=3;
    while t<=l-2
        Int_1=Int_1+y(t);
        t=t+2;
    end
   
    k=2;
    Int_2=0;
    while k<=l-1
        Int_2=Int_2+y(k);
        k=k+2;
    end
    warning('requires trapiziodal rule')
    Int_3=(x(Z)-x(Z-1))*(y(Z)+y(Z-1))/2;
    
    if Z > 2,stepsize=(x(Z)-x(1))/(3*(l));
    else, stepsize = x(2) -x(1);
    end
    I=(stepsize*(y(1)+(4*Int_2)+(2*Int_1)+y(Z-1)))+Int_3;
end

end