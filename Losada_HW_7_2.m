smallest = 1;
u = 1;
while (1)
    if smallest(u) ~= 0
        smallest(u+1) = smallest(u)/2;
    else
        break
    end
    u = u+1;
end
smallest = (smallest(length(smallest)-1));
disp(smallest)