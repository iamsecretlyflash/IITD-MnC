lol = hybrid(0.1,-10,15)
function root = hybrid(s,a,b)
    tempRoot = bisection(s,a,b)
    root = newtonRaphson(tempRoot,10^-8,100);
end

function root = bisection(s,st,en)
    a = st;b = en;
    iter = 0;
    if f(en) == 0
        root = en;
    elseif f(st) == 0
        root = st;
    else
        mid = (st+en)/2;
        while abs(en-st)>s*(b-a)
            iter = iter +1;
            root = f(mid);
            
            if root*f(st)<0
                en = mid;
                mid = (st+mid)/2;
            else
                st = mid;
                mid = (en+mid)/2;
            end
        root = mid;
        end
    end
    iter
end

function root = newtonRaphson(x0,e,n)
    iter = 0;
    while iter<n
        x1 = x0 - f(x0)/fdash(x0);
        if abs((x1-x0)/x1)*100 <e | f(x1) == 0
            break
        end
        x0 = x1;
        iter = iter+1;
    root = x1;
    end
    iter
end

function val = f(x)
    val = tanh(x);
end

function val = fdash(x)
    val = 1 - (tanh(x))*2;
end