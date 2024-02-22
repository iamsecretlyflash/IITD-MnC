format longg
len = getChord(10)

function val = getChord(r)
    theta = newtonRaphson(pi,10^-8,100)
    ff = @sin;
    val = 2*r*ff(theta/2);
end

function root = newtonRaphson(x0,e,n)
    iter = 0;
    while iter<n
        x1 = x0 - f(x0)/f1(x0);
        if abs((x1-x0)/(x1))*100 <e
            break
        end
        x0 = x1;
    root = x1;
    iter = iter+1;
    end
end


function  val = f(x)
    g = @sin;
    val = 4*g(x/2) + x -2*pi;
end

function val = f1(x)
    g = @cos;
    val = 2*g(x/2) + 1;
end

