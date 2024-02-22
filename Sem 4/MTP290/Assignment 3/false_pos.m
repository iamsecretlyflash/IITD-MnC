xl = 1.5 ; xu = 3;
tol = 1e-6;
temp_tol = 100;
root = 100;
while temp_tol>tol
    xr = xu -(f(xu)*(xl-xu))/(f(xl)-f(xu));
    temp_tol = abs((root-xr)/xr);
    root = xr;
    if f(xu)*f(xr)>0
        xu = xr;
    else
        xl = xr;
    end
end
root
f(root)
function val = f(x)
    val = x*x - 9*x +1;
end
