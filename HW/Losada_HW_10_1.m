% Question 1
% Use bisection method to find coefficient of drag
g =9.81; m = 95; v = 46; t = 9;
cd = linspace(0.2,0.5);
% cd = 0.425;
fl = sqrt((g*m)./cd).*tanh(sqrt((g*cd/m))*t)-v;
plot(cd,fl)
cdl = min(cd); cdu = max(cd);
i = 1;
cdr = zeros(1,100);
% fz = zeros(1,100);
while(1)
    cdr(i) = (cdl+cdu)/2;
    fz = sqrt((g*m)/cdr(i))*tanh(sqrt((g*cdr(i)/m))*t)-v;
    fl = sqrt((g*m)/cdl)*tanh(sqrt((g*cdl/m))*t)-v;
    if fz*fl > 0
        cdl = cdr(i);
    else
        cdu = cdr(i);
    end
    if fz == 0
        break
    elseif i == 100
        break
    elseif i > 1
        ea = abs((cdr(i) - cdr(i-1))/cdr(i))*100;
        if ea <=5
           break            
        end
    end
    i = i+1;
end
disp(cdr(i)) 
