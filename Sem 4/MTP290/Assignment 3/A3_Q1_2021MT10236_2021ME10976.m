
%Trapezoidal Rule
format longg
%I = (b-a)(f(a) + f(b))/2
%actual answer = 2*arctan(4) = 2.6516
b = 4; a = -4;
syms x
meow = 1/(1+x*x);
meowmeow = vpa(int(meow,-4,4));
fprintf("\nIntegral calculated using in-built calculator : %.16f\n",meowmeow)
fprintf("\nSUB-PART (a)\n")
%Calculating area by taking a as -4 and b as 4 
I = ((b-a)/2)*(f(b)+f(a));
fprintf("\nArea calculated by aplying trapezoidal rule in the interval [-4,4] : %.16f\n",I)
fprintf("Error from in-built calc's answer = %.16f%%\n",100*abs(I-meowmeow)/meowmeow)

% Calculating area by taking a as 0 and b as 4 and multiplying by 2(
%due to symmetry)
%NOT A PART OF THE PROBLEM STATEMENT BUT INTERESTING TO LOOK AT
I = 2*(b-(0))*(1/2)*(f(0)+f(b));
fprintf("\nArea calculated by aplying trapezoidal rule in the interval [-4,0] and multipyling by 2 : %.16f\n",I)
fprintf("Error from in-built calc's answer = %.16f%%\n",100*abs(I-meowmeow)/meowmeow)

%Simpson's 1/3 Rule
fprintf("\nSUB-PART (b)\n")
x_mid= 0;
I = simpsons_one_third_interval(a,b);
fprintf("\nArea calculated by aplying simpson's 1/3 rule once in the interval [-4,4] : %.16f\n",I)
fprintf("Error from in-built calc's answer = %.16f%%\n",100*abs(I-meowmeow)/meowmeow)

fprintf("\nSUB-PART (c)\n")
fprintf("\nCOMPOSITE TRAPEZOIDAL RULE")
%Composite Trapezoid
%2.65114192685511
format longg
n = 10;
res = 0;
start = a;
lst = linspace(a,b,n+1);
for i = 1:n
    res = res+(lst(i+1)-lst(i))*(1/2)*(f(lst(i))+f(lst(i+1)));
    start  = i;
end
fprintf("\nArea calculated by aplying Trapezoidal rule 10 times in the interval [-4,4] : %.16f\n",res)
fprintf("Error from in-built calc's answer = %.16f%%\n",100*abs(res-meowmeow)/meowmeow)

fprintf("\nCOMPOSITE SIMPSON'S 1/3 RULE")
%Composite Simpson's 1/3 Rule 2.69528592236713
n = 10;

% We will be taking n/2 because the code takes n as the number of itnervals
% But in the question n is the n of x0,x1 ... xn
% n = 10 implies 5 intervals
lst = linspace(a,b,n/2+1); % Created n/2 + 1 points to demark intervals. (n is even)
res = 0;
for i = 1:n/2    
    res = res + simpsons_one_third_interval(lst(i),lst(i+1));
end
fprintf("\nArea calculated by aplying composite Simpson's 1/3 rule in the interval [-4,4] : %.16f\n",res)
fprintf("Error from in-built calc's answer = %.16f%%\n",100*abs(res-meowmeow)/meowmeow)

function val = simpsons_one_third_interval(l,r)
    % subroutine to calculate the value of the integral in a smaller
    % interval
    mid = (l+r)/2;
    val = ((r-l)/6)*(f(l) + 4*f(mid) + f(r));
end

function val = f(x)
    val = 1/(1+x*x);
end

