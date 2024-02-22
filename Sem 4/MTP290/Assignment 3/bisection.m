%bisection
l = 1.5 ; r = 3;
tol = 1e-6;
temp_tol = 100;
root = 100;
while temp_tol>tol
    mid = (l+r)/2;
    temp_tol = abs(root-mid)/mid;
    root = mid;
    if f(root)*f(l) <0
        r = root;
    else 
        if f(root)*f(r)<0
            l = root;
        end
    end

end
root
f(root)

