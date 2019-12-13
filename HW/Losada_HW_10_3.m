% Losada_HW_10_3
% Question 3
% Use bisection method to find Xr
c_a = 42; c_b = 28; c_c = 4; KK = 0.016;
x = linspace(0,20);
k = (c_c+x)./(((c_a-2*x).^2).*(c_b-x))-KK;
plot(x,k)
xl = min(x); xu = max(x);
i = 1;
xr = zeros(1,100);
% fz = zeros(1,100);
while(1)
    xr(i) = (xl+xu)/2;
    fz = (c_c+xr(i))/(((c_a-2*xr(i))^2)*(c_b-xr(i)))-KK;
    k = (c_c+xl)/(((c_a-2*xl)^2)*(c_b-xl))-KK;
    if fz*k > 0
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
        if ea <=0.5
           break            
        end
    end
    i = i+1;
end
disp(xr(i)) 
