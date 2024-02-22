format longg
[r,i] = newton()
cos(r)
[r,i] = bisection()
cos(r)
function [root,iter] = newton()
    root = pi/4
    eps = 100; tol = 100; iter = 0;
    while (eps >10^-6) | (tol>10^-8)
        x1 = root -f(root)/f1(root);
        eps = abs(x1-root);
        tol = f(x1);
        root = x1;
        iter = iter +1;
    end
end

function [root,iter] = bisection()
    xl = 0; xr = pi/2;iter = 0;
    eps = 100;
    while eps>10^-8
        root = (xl+xr)/2;
        iter = iter +1;
        val = f(root);
        if abs(val)<=10^-8
            break
        else
            if val*f(xl)<0
                xr = root;
            else
                xl = root;
            end
            eps = abs(root-(xl+xr)/2);
        end
    end
end


function val = f(x)
    val = cos(x)-x;
end

function val = f1(x)   
    val = -1-sin(x);
end