a = 0; b =1 ; tol = 1e-6;
f = @(x) (1/(1+x*x));

syms x
g = 1/(1+x*x);
true_ans = vpa(int(g,a,b));
fprintf("\nValue of the integral using in-built calculator  = %.16f\n\n",true_ans)

anss = 100;
temp_tol = 100;
n = 1;
iter = 0;
while temp_tol >tol
    res = 0;
    start = a;
    lst = linspace(a,b,n+1);
    for i = 1:n
        mid = (lst(i)+lst(i+1))/2;
        res = res+ (lst(i+1)-lst(i))*f(mid);
        start  = i;
    end

    temp_tol = abs((anss-res)/anss);
    anss = res;
    iter = iter+1;
    n = n*2;
end
fprintf("INCREASING THE INTERVAL SIZE BY MULTIPLES OF 2\nValue of the intergal  = %.16f\nInterval size = %d\nNumber of iterations = %d\n",anss,n,iter)
fprintf("Final Relative error = %.16f\n",(temp_tol))
fprintf("Error from the in-built calc's answer = %.16f%%\n",100*abs(anss-true_ans)/true_ans)

anss = 100;
temp_tol = 100;
n = 0;
iter = 0;
while temp_tol >tol
    n = n+1;
    res = 0;
    start = a;
    lst = linspace(a,b,n+1);
    for i = 1:n
        mid = (lst(i)+lst(i+1))/2;
        res = res+ (lst(i+1)-lst(i))*f(mid);
        start  = i;
    end

    temp_tol = abs((anss-res)/anss);
    anss = res;
    iter = iter +1;
end

fprintf("\nINCREASING THE INTERVAL SIZE BY ADDING 1\nValue of the intergal  = %.16f\nInterval size = %d\nNumber of iterations = %d\n",anss,n,iter)
fprintf("Final Relative error = %.16f\n",(temp_tol))
fprintf("Error from the in-built calc's answer = %.16f%%\n",100*abs(anss-true_ans)/true_ans)
fprintf("\nNotice that convergence is faster and more accurate in the case of multiplying the interval sizes by 2\n")
