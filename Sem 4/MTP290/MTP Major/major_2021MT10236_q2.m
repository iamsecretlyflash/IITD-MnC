syms x
g = sqrt(1+(pi*cos(pi*x))^2);
meow = sqrt(1+(2*x*exp(x*x))^2);
fprintf("\nsin(pi*x) using in-built = %.16f\n",vpa(int(g,0,1)))
fprintf("\nexp(x*x) using in-built = %.16f\n",vpa(int(meow,0,2)))

fprintf("\nSUB PART(a) TRAPEZOIDAL RULE\n")
fprintf("\nsin(pi*x)")
n_l = [16 32 64];
for i = 1:3
    n = n_l(i);
    a = 0;b = 1;
    points = linspace(a,b,n+1);
    %using linspace to generate n+1 points or n sub-intervals
    res = 0;
    for j = 1:n
        res = res + trapezoid(points(j),points(j+1),0);
    end
    fprintf("\nN = %f Integral = %.16f",n,res)
end


fprintf("\n\nexp(x^2)")
n_l = [16 32 64];
for i = 1:3
    n = n_l(i);
    a = 0;b = 2;
    points = linspace(a,b,n+1);
    res = 0;
    for j = 1:n
        res = res + trapezoid(points(j),points(j+1),1);
    end
    fprintf("\nN = %f Integral = %.16f",n,res)
end

fprintf("\n\nSUB PART(b) SIMPSONS RULE\n")
fprintf("\nsin(pi*x)")
n_l = [16 32 64];
for i = 1:3
    n = n_l(i);
    a = 0;b = 1;
    points = linspace(a,b,n/2+1);% I have explained below why I am generating n/2+1 points as this gives us n/2 intervals
                                   % and each of ther intervals is split
                                   % into 2 intervals giving a total of n
                                   % intervals
    res = 0;
    for j = 1:n/2
        %instead of passing x0,x1,x2,x3
        % I am passing x0,x2 then x2,x4. *with n/2 each of the consecutive
        % point in linspace are even points
        % the functions calculates the midpoint by itself, e.g, (x0+x2)/2
        % and evaluated using simpson's 1/3 method
        res = res + simp(points(j),points(j+1),0);
    end
    fprintf("\nN = %f Integral = %.16f",n,res)
end


fprintf("\n\nexp(x^2)")
n_l = [16 32 64];
for i = 1:3
    n = n_l(i);
    a = 0;b = 2;
    points = linspace(a,b,n/2+1); % I have explained below why I am generating n/2+1 points as this gives us n/2 intervals
                                   % and each of ther intervals is split
                                   % into 2 intervals giving a total of n
                                   % intervals
    res = 0;
    for j = 1:n/2
        %instead of passing x0,x1,x2,x3
        % I am passing x0,x2 then x2,x4. *with n/2 each of the consecutive
        % point in linspace are even points
        % the functions calculates the midpoint by itself, e.g, (x0+x2)/2
        % and evaluated using simpson's 1/3 method
        res = res + simp(points(j),points(j+1),1);
    end
    fprintf("\nN = %f Integral = %.16f",n,res)
end
fprintf("\n")


function val = trapezoid(a,b,do)
    if do == 0%compute for sin(pi*x)
        val = (1/2)*(b-a)*(f1(a)+f1(b));
    else%compute for exp(x*x)
        val = (1/2)*(b-a)*(f2(a)+f2(b));
    end
end

function val = simp(a,b,do)
    % h is (b-a)/2 here
    mid = (a+b)/2;
    if do == 0 %compute for sin(pi*x)
        val= ((b-a)/6)*(f1(a) + 4*f1(mid) + f1(b));
    else %compute for exp(x*x)
        val= ((b-a)/6)*(f2(a) + 4*f2(mid) + f2(b));
    end
end


function val = f1(x)
    val = sqrt(1+(pi*cos(pi*x))^2);
end

function val = f2(x)
    val = sqrt(1+(2*x*exp(x*x))^2);
end