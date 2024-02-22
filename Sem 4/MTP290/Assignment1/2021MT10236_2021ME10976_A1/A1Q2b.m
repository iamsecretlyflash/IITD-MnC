% We will substitute for one variable in the second equation. That will give us a equation in one variable
% we will then try to find its root via newton's method.

x = newtonRaphson(6,10^-8,1000);                % x being the smaller number, the initial guess is lower.
y = 20-x;
display(x)
display(y)
function root = newtonRaphson(x0,e,n)           % x0= initial guess, e= tolerance limit, n= max iterations
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

function v = f(x)                               % function obtained by substitution.
    v = (x+x^0.5)*((20-x)+(20-x)^0.5)-155.55;
end
function v = fdash(x)                           % derivative of the above function.
    v = (x+x^0.5)*(-1/(2*((20-x)^0.5))-1) + (1/(2*x^0.5)+1)*((20-x) + (20-x)^0.5);
end
%x = 6.51284872610814 is the actual root as shown by wolfram alpha.