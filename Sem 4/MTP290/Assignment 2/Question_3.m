a1 = [4 1 -1 ; 2 7 1; 1 -3 12];
b1 = [3;19;31];
[x1a,x2a,x3a] = solve(a1,b1,10^-8,0,0,0);
a1\b1;


function [x1,x2,x3] = solve(a,b,prec,x1,x2,x3)
    prec_max = 100;
    while prec_max>prec
        x11 = (b(1) - a(1,2)*x2 - a(1,3)*x3)/a(1,1);
        x22 = (b(2) - a(2,1)*x1 - a(2,3)*x3)/a(2,2);
        x33 = (b(3) - a(3,1)*x1 - a(3,2)*x2)/a(3,3);
        p1 = abs(((x11-x1)/x11)*100); p2 = abs(((x22-x2)/x22)*100); p3 = abs(((x33-x3)/x33)*100);
        prec_max = max([p1,p2,p3]);
        x1 = x11;x2 = x22;x3 = x33;
    end
end

