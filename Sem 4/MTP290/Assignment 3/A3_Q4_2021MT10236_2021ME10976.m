
a = 0; b =10 ; tol = 1e-6;
syms x
g = sin(x)/x;
actual_ans = vpa(int(g,0,10));
fprintf("\nValue of the intergal using in-built integral calculator = %.16f\n",actual_ans)
anss = 100;
temp_tol = 100;
n = 0;
iter = 0;
while temp_tol >tol
    iter = iter +1;
    n = n+1;
    res = 0;
    lst = linspace(a,b,n+1);
    for i = 1:n
            res = res+((lst(i+1)-lst(i))/2)*(f(lst(i))+f(lst(i+1)));
    end

    temp_tol = abs((anss-res)/res);
    anss = res;
end


fprintf("\nINCREASING INTERVAL SIZES BY ADDING 1\nValue of the intergal using Trapezoidal Rule = %.16f\nNumber of iterations = %d\nInterval size = %d\n",anss,iter,n)
fprintf("Final Relative error = %.16f\n",(temp_tol))
fprintf("Error from the in-built calc's answer = %.16f%%\n",100*abs(anss-actual_ans)/actual_ans)
anss = 100;
temp_tol = 100;
n = 1/2;
iter = 0;
while temp_tol >tol
    iter = iter +1;
    n = n*2;
    res = 0;
    lst = linspace(a,b,n+1);
    for i = 1:n
            res = res+((lst(i+1)-lst(i))/2)*(f(lst(i))+f(lst(i+1)));
    end

    temp_tol = abs((anss-res)/res);
    anss = res;
end

fprintf("\nINCREASING INTERVAL SIZES BY MULTIPLES OF 2\nValue of the intergal using Trapezoidal Rule = %.16f\nNumber of iterations = %d\nInterval size = %d\n",anss,iter,n)
fprintf("Final Relative error = %.16f\n",(temp_tol))
fprintf("Error from the in-built calc's answer = %.16f%%\n",100*abs(anss-actual_ans)/actual_ans)
fprintf("\nNotice that convergence is faster and more accurate in the case of multiplying the interval sizes by 2\n")





function val = f(x)
    if x == 0
        val = 1;
    else
        val = sin(x)/x;
    end
end

