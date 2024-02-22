x = [0 0.2 0.4 0.5 0.6 0.7];

%applying 1/3 in [0,0.2,0.4] and 3/8 in [0.4,0.5,0.6,0.7]
ans13 = (0.2/3)*(f(x(1)) +4*f(x(2)) + f(x(3)));
ans34 = (3/8)*(f(x(3)) + 3*f(x(4)) + 3*f(x(5)) + f(x(6)))*(0.1);

fprintf("\nAnswer using combination of 1/3 and 3/8 = %.16f\n",ans13+ans34);
syms x
g = 0.2 +2.5*x -200*x^2 +675*x^3- 900*x^4+ 400*x^5;
fprintf("\nAnswer using in-built = %.16f\n",vpa(int(g,0,0.7)));

function val = f(x)
    val = 0.2 +2.5*x -200*x^2 +675*x^3- 900*x^4+ 400*x^5;
end