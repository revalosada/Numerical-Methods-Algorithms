% Losada_HW_10_2
% Question 2
% Use bisection method to find Xr
x = linspace(-1,0);
fx = -12-21*x+(18*x.^2)-(2.75*x.^3);
plot(x,fx)
xl = min(x); xu = max(x);
i = 1;
xr = zeros(1,100);
% fz = zeros(1,100);
while(1)
    xr(i) = (xl+xu)/2;
    fz = -12-21*xr(i)+(18*xr(i)^2)-(2.75*xr(i)^3);
    fx = -12-21*xl+(18*xl^2)-(2.75*xl^3);
    if fz*fx > 0
        xl = xr(i);
    else
        xu = xr(i);
    end
    if fz == 0
        break
    elseif i == 100
        break
    elseif i > 1
        ea = abs((xr(i) - xr(i-1))/xr(i))*100;
        if ea <=1
           break            
        end
    end
    i = i+1;
end
disp(xr(i)) 
