a1 = [4 1 -1 ; 2 7 1; 1 -3 12];
b1 = [3;19;31];

[x1a,x2a,x3a,iter] = solve(a1,b1,10^-8,0,0,0,1000);
fprintf('\nQuestion 3 Part a\n\nRoots using Gauss Jacobi Method : x1 = %d; x2= %d; x3 = %d\n',x1a,x2a,x3a)
fprintf('Initial guess : (%d,%d,%d)\n',0,0,0)
fprintf('Number of iterations: %d\n\n',iter)
r=a1\b1;
fprintf('Root using MATLABs inbuilt calculator x1 = %d; x2= %d; x3 = %d\n\n',r(1),r(2),r(3))

a21 = [1 2 3; 2 -1 2; 3 1 -2];
b21 = [5; 1; -1];
[x1b,x2b,x3b,iter] = solve(a21,b21,10^-8,0,0,0,1000);
fprintf('----------------------------------------------------------------------------------------------------')
fprintf('\n\nQuestion 3 Part b\n\nRoots using Gauss Jacobi Method : x1 = %d; x2= %d; x3 = %d\n',x1b,x2b,x3b)
fprintf('Initial guess : (%f,%f,%f)\n',0,0,0)
fprintf('Number of iterations: %d\n\n',iter)

[x11b,x22b,x33b,iter] = solve(a21,b21,10^-8,0.18,1,1,1000);
fprintf('Roots using Gauss Jacobi Method : x1 = %d; x2= %d; x3 = %d\n',x11b,x22b,x33b)
fprintf('Initial guess : (%f,%f,%f)\n',0.18,1,1)
fprintf('Number of iterations: %d\n\n',iter)

[x11b,x22b,x33b,iter] = solve(a21,b21,10^-8,0.8,0.6,0.5,1000);
fprintf('Roots using Gauss Jacobi Method : x1 = %d; x2= %d; x3 = %d\n',x11b,x22b,x33b)
fprintf('Initial guess : (%f,%f,%f)\n',0.8,0.6,0.5)
fprintf('Number of iterations: %d\n\n',iter)

fprintf('In all above cases the root is not defined\n')
format short
r=a21\b21;
fprintf('\nRoot using MATLABs inbuilt calculator x1 = %d; x2= %d; x3 = %d\n',r(1),r(2),r(3))

function [x1,x2,x3,iter] = solve(a,b,prec,x1,x2,x3,max_iter)
    prec_max = 100;
    iter = 0;
    while prec_max>prec && iter<max_iter
        x11 = (b(1) - a(1,2)*x2 - a(1,3)*x3)/a(1,1);
        x22 = (b(2) - a(2,1)*x1 - a(2,3)*x3)/a(2,2);
        x33 = (b(3) - a(3,1)*x1 - a(3,2)*x2)/a(3,3);
        p1 = abs(((x11-x1)/x11)*100); p2 = abs(((x22-x2)/x22)*100); p3 = abs(((x33-x3)/x33)*100);
        prec_max = max([p1,p2,p3]);
        x1 = x11;x2 = x22;x3 = x33;
        iter = iter+1;
    end
end

