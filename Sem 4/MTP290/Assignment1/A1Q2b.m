x = newtonRaphson(6,10^-8,1000);
y = 20-x;
display(x)
display(y)
function root = newtonRaphson(x0,e,n)
    iter = 0;
    while iter<n
        x1 = x0 - f(x0)/fdash(x0);
        if abs((x1-x0)/x1)*100 <e
            break
        end
        x0 = x1;
    root = x1;
    iter=iter+1;
    end
end

function v = f(x)
    v = (x+x^0.5)*((20-x)+(20-x)^0.5)-155.55;
end
function v = fdash(x)
    v = (x+x^0.5)*(-1/(2*((20-x)^0.5))-1) + (1/(2*x^0.5)+1)*((20-x) + (20-x)^0.5);
end
%6.51284872610814