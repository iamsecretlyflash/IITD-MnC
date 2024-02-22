a1 = [ 25 5 1 ;64 8 1;144 12 1];
b1 = [ 106.8; 177.2; 279.2];
[a,b,c,iter] = solve(a1,b1,10^-8,1,2,5,1000);
r = a1\b1;

fprintf('\nQuestion 4\nPrecision used : %d\nMaximum Iterations = %f\n\n',10^-8,1000)
fprintf('Roots using Gauss-Seidel Method without any changes: a = %d; b= %d; c = %d\n',a,b,c)
fprintf('Initial guess : (%d,%d,%d)\n',1,2,5)
fprintf('Number of iterations: %d\n\n',iter)
%precision in above case becomes zero

a1 = [ 144 12 1;64 8 1;25 5 1 ];
b1 = [ 279.2; 177.2; 106.8];
[a,b,c,iter] = solve(a1,b1,10^-8,1,2,5,1000);
r = a1\b1;

fprintf('Roots using Gauss-Seidel Method after exchanging rows 1 and 3: a = %d; b= %d; c = %d\n',a,b,c)
fprintf('Initial guess : (%d,%d,%d)\n',1,2,5)
fprintf('Number of iterations: %d\n\n',iter)
fprintf('Root using MATLABs inbuilt calculator a = %d; b = %d; c = %d\n',r(1),r(2),r(3))
function [x1,x2,x3,iter] = solve(a,b,prec,x1,x2,x3,max_iter)
    prec_max = 100;
    iter = 0;
    while prec_max>prec && iter < max_iter
        x11 = (b(1) - a(1,2)*x2 - a(1,3)*x3)/a(1,1);
        x22 = (b(2) - a(2,1)*x11 - a(2,3)*x3)/a(2,2);
        x33 = (b(3) - a(3,1)*x11 - a(3,2)*x22)/a(3,3);
        iter = iter+1;
        p1 = abs(((x11-x1)/x11)*100); p2 = abs(((x22-x2)/x22)*100); p3 = abs(((x33-x3)/x33)*100);
        prec_max = max([p1,p2,p3]);
        x1 = x11;x2 = x22;x3 = x33;
    end
end


