format longg
[r,i] = newton()
f(r)
function [root,iter] = newton()
    conv = [];
    root = 0.1;
    ek = 0.1;
    tol = 100; iter = 0;
    while (tol>10^-20)
        x1 = root -2*f(root)/f1(root);
        tol = f(x1);
        root = x1;
        conv(end+1) = abs(root)/(ek*ek);
        ek = abs(root);
        iter = iter +1;
    end
    conv
    plot(conv)
end

function val = f(x)
    val = x*x;
end

function val = f1(x)   
    val = 2*x;
end