% We print the root found out and the number of iterations it took .
% For each of the methods mentioned.

[root_via_hybrid ,iterations_in_hybrid] = hybrid(0.1,-10,15)    
fprintf("\n\nSTANDARD BISECTION METHOD\n\n")
[root_via_bisection,iterations_in_bisection] = bisectionNormal(10^-8,-10,15)
fprintf("\n\nSTANDARD NEWTON'S METHOD\n\n")
[root_via_newtons,iterations_in_newtons] = newtonRaphson(0.5,10^-8,1000)

%the hybrid method seems to perform much better on all metrics 
% it takes much less iterations (10)* than bisection(28)* and newton's(23)*
% and the root is also much closer to the actual value(~10^-29)* than
% newton's(10^-17)* and bisection(~10^-9)
% *values as found on our local machines

%We concluded that the hybrid method performs better because the bisection
%part compressed the range in which newton raphson as to iterate to find
%the root. Hence, when employing newton raphson, we start with an initial
%guess that is much closer to the actual root, and bisection allows us to
%reach such an initial guess.

%On the other hand, both methods when employed alone have drawback.
%Bisection has to divide intervals for a longer time to get the
%desired value, while newton raphson has to iterate longer.

function [root,iter] = hybrid(s,a,b)
    [tempRoot,iter1] = bisectionHybrid(s,a,b);
    [root,iter2] = newtonRaphson(tempRoot,10^-8,100);       % We feed the last root calculated by bisection as the initial guess to Newton's method
    iter=iter1+iter2;
    fprintf('HYBRID METHOD\nBisection Steps = %d\nNewton Raphson Steps = %d\n',iter1,iter2)

end

function [root,iter] = bisectionHybrid(s,st,en)               % s= toleartion, st= interval start, en=interval end
    a = st;b = en;                                      % root= calculated zero, iter= no. of iterations taken
    iter = 0;
    if f(en) == 0
        root = en;
    elseif f(st) == 0
        root = st;
    else
        mid = (st+en)/2;
        while abs(en-st)>s*(b-a) % stopping condition is now interval size. works for 
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
end

function [root,iter] = newtonRaphson(x0,e,n)    % x0= initial guess, e= interval start, n=interval end
    iter = 0;                                   % root= calculated zero, iter= no. of iterations taken
    while iter<n
        x1 = x0 - f(x0)/fdash(x0);
        if abs((x1-x0)/x1)*100 <e || f(x1) == 0
            break
        end
        x0 = x1;
        iter = iter+1;
    root = x1;
    end
end

function [root,iter] = bisectionNormal(t,st,en) %normal bisection method
    iter = 0;
    if f(en) == 0
        root = en;
    elseif f(st) == 0
        root = st;
    else
        mid = (st+en)/2;
        while abs(f(mid))>t %f(root) isn't greater than t
            iter= iter+1;
            if f(mid)*f(st)<0
                en = mid;
                mid = (st+mid)/2;

            else
                st = mid;
                mid = (en+mid)/2;
            end
        root = mid;
        end
    end
end

function val = f(x)                         % defining f(x) as tanh(x)
    val = tanh(x);
end

function val = fdash(x)                     % derviative of f(x)
    val = 1 - (tanh(x))*2;
end