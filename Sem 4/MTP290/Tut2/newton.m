root = newtonRaphson(0.5,0.1,1000)

function root = newtonRaphson(x0,e,n)
    iter = 0;
    while iter<n
        x1 = x0 - f(x0)/fdash(x0);
        if abs((x1-x0)/x1)*100 <e
            break
        end
        x0 = x1;
    root = x1;
    end
end

function v = f(x)
    v = x*x*x-216;
end
function v = fdash(x)
    v = 3*x*x;
end