x0 = 4;
tol = 1e-6;
temp_tol = 100;
root = 100;
while temp_tol>tol
    xr = x0 - f(x0)/f1(x0);
    temp_tol = abs((xr-x0)/xr);
    x0 = xr;
end
x0
function val = f(x)
    val = x*x - 9*x +1;
end
function val = f1(x)
    val = 2*x -9;
end
