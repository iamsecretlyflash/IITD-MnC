syms x
ff = exp(x)/(1+x);
a = 0;b = 2;n =4;
actual_ans = vpa(int(ff,a,b));
fprintf("\nSUB-PART (a)\n")
fprintf("\nValue of the integral [exp(x)/(1+x) in 0 to 2] using in-built integral calculator = %.16f\n",actual_ans)

%Simpson's 1/3 rule
lst = linspace(a,b,n/2+1);
ans13 = 0;
%n/2 by same logic for q1
for i = 1:n/2
    %iterating over intervals to calculate the value of the integral
    ans13 = ans13 + simpsons_one_third_interval(lst(i),lst(i+1));
end
fprintf("\nValue of the integral [exp(x)/(1+x) in 0 to 2] using composite simpson's 1/3 method = %.16f\n",ans13)
fprintf("Error from the in-built calc's answer = %.16f%%\n",100*abs(ans13-actual_ans)/actual_ans)

%using in built intergal

fprintf("\nSUB-PART (b)\n")
%using 3/8 method
fprintf("\nIterating over segment length to get relative error under the tolerance")
n = 1; tol = 1e-6;
temp_tol = 100;
temp_ans = 10000;
a = 0;b = pi/2;
iter = 0;
while temp_tol >tol
    n = n*2;
    iter = iter +1;
    lst = linspace(a,b,n+1);
    res = simpson_three_eight(lst,n);
    temp_tol = (abs(res-temp_ans))/res;
    temp_ans = res;
end
%note that each of the intervals are divided into three intervals to get 4
%points i.e, x0,x1,x2 and x3
% for each interval we get these points and get the area
fprintf("\nINCREASING THE NUMBER OF INTERVALS BY MULTIPLES OF 2\nValue of the intergal of [sin(x) in 0 to pi/2] using simpson's 3/8 method = %.16f\nNumber of iterations = %d\n",temp_ans,iter)
fprintf("Final Relative error = %.16f\n",(temp_tol))
fprintf("Error from the actual answer(1) = %.16f%%\n",100*abs(temp_ans-1)/1)
function val = simpsons_one_third_interval(l,r)
    % subroutine to calculate the value of the integral in a smaller
    % interval
    f = @(x) exp(x)/(1+x);
    mid = (l+r)/2;
    val = ((r-l)/6)*(f(l) + 4*f(mid) + f(r));
end


function val = simpson_three_eight(lst,n)
    %function to calvulate the value of the integral in the given range
    %by splitting the range into n sub-ranges
    val = 0;
    for i = 1:n
        val = val + simpson_three_eight_method(lst(i),lst(i+1));
    end
    
end

function val = simpson_three_eight_method(l,r)
    % subroutine to calculate the value of the integral in a smaller
    % interval
    mid1 = l + (r-l)/3;
    mid2 = l + 2*(r-l)/3;

    val = ((r-l)/8)*(g(l) + 3*g(mid1) + 3*g(mid2) + g(r));
end



function val = g(x)
    val = sin(x);
end

