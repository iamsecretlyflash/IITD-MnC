tiledlayout(3,1) %three plots : 1) f(x) vs x around 1/3. (2) and (3) ek/(ek+1)^2 for orig and mod methods
lol = toshowmult(1/3); % shows that their's a triple root at x = 1/3 by calculating f,f',f'',f''' anf f''''
x = linspace(1/8,1,80); %for plotting f
vals =[];
for s = 1:40
    vals(end+1) = f(x(s));%f(x) for diff x
end
nexttile
plot(x(1:40),vals)
%plot of f(x) vs x around 1/3
%from plot we can see that 1) f(1/3) = 0. slop is 0 at 1/3 and the
%convexity of the function changes. hence triple root
title('f(x) = 27x^4 + 162x^3 - 180x^2 + 62x - 7')

nexttile
rootOrig = newtonRaphsonOrig(0,10^-8,1000) % root from original newton raphson
%plot of ek/(ek+1)^2 for original newton raphson.
% we see that the value is almost constant except for a spike at ~ 29
% (probably due to machine calculation limitations)
title('Normal Newton Raphson')

nexttile
rootMod = newtonRaphsonMod(0,10^-8,1000,3) % root from modified newton raphson
%plot of ek/(ek+1)^2 for modified newton raphson.
% spike at ~ 3
title('Newton Raphson with m = 3')

function lol = toshowmult(x)
    fprintf('at 1/3 \nf = %f\nf1 = %f\nf2 = %f\nf3 = %f\nf4 = %f\n',f(x),f1(x),f2(x),f3(x),f4(x));
    fprintf('since f,f1 and f2 are 0 and f3 != 0 we have a triple root at 1/3\n :)\n')
    lol = 1300135;
end

function root = newtonRaphsonOrig(x0,e,n)
    fprintf("NORMAL NEWTON RAPHSON METHOD\n")
    iter = 0;
    err = [];
    ek = abs(1/3-x0);
    while iter<n
        x1 = x0 - f(x0)/f1(x0);
        ek_1 = abs(1/3-x1);
        if abs((x1-x0)/(x1))*100 <e
            break
        end
        x0 = x1;
        err(end+1) = ek_1/(ek*ek);
        ek=ek_1;
    root = x1;
    iter = iter+1;
    end
    plot(err);
    fprintf('Total number of iterations = %f',iter);
end

function root = newtonRaphsonMod(x0,e,n,m)
    fprintf("NEWTON RAPHSON WITH m = %d\n",m)
    iter = 0;
    err = [];
    ek = abs(1/3-x0);
    while iter<n
        x1 = x0 - m*f(x0)/f1(x0); %multiplicity = 3
        ek_1 = abs(1/3-x1);
        if abs((x1-x0)/(x1))*100 <e
            break
        end
        x0 = x1;
        err(end+1) = ek_1/(ek*ek);
        ek=ek_1;
    root = x1;
    iter = iter+1;
    end
    plot(err);
    fprintf('Total number of iterations = %f',iter);
end

function val = f(x)                                     % original function
    val = 27*x^4 + 162*x^3 -180*x^2 + 62*x -7;
end

function val = f1(x)                                    % first derivative
    val = 108*x^3 +486*x^2 -360*x + 62;
end

function val = f2(x)                                    % second derivative
    val = 324*x^2 + 972*x -360;
end

function val = f3(x)                                    % third derivative
    val = 648*x + 972;
end

function val = f4(x)                                    % fourth derivative
    val = 648;
end