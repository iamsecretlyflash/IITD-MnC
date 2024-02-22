% How to calculate 1/a using division.
% The basic idea  is to use ax=1 and take f(x) = 1/x -a
% Now we use Newton's Method to calculate roots
% for |a|<=1 we use 0.1 times a as the starting point
% for |a| >1 we use a/(10^([3*log(a)])
% we are doing this to stay on the left side of the root
% as the function is always decreasing
format longg
a = input('Enter a : ');
if (a<=1) &&(a>=-1) %assigning starting value for |a| <=1
    start = a*0.1;
else % for |a|>1
    start = a*10^(-3*ceil(log10(a)));
end

root = newtonRaphson(start,a,10^-8,1000)

function root = newtonRaphson(x0,a,e,n)
    iter = 0;root=0;
    while iter<n
        % x1 = x0 - f(x0)/f'(x0) 
        % x1 = x0 - (1/x0-a)(-1/x0*x0)
        % x1 = x0 + x0 - a*x0*x0 
        % x1 = 2*x0 -a*x0*x0
        x1 = 2*x0 - a*x0*x0; 
        if abs((x1-x0))*100 <e*abs(x1)
            break
        end
        x0 = x1;
    root = x1;
    iter = iter+1;
    end
    fprintf('Total number of iterations = %f',iter);
end