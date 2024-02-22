format longg
x=[ 1	 , 1.3	 , 1.6	 , 1.9, 2.2];
y	 =[ 0.1411	,  -0.6878	,  -0.9962	,  -0.5507	,  0.3115];
func_approx(1,y,x);
xx = linspace(0,3);
yy = zeros(100);
for i = 1:100
    yy(i) = func_approx(xx(i),y,x);
end
plot(xx,yy)
%The curve resembles a BI-QUADRATIC POLYNOMIAL
%f(x) = c*(x-0.454545)(x-1.06061)(x-2.050)(x-2.69697)
function val = func_approx(x,y,points)
    val = 0;
    [m, n] = size(points);
    for i = 1:n
        val = val + y(i)*Li(x,i,points);
    end
end

function val = Li(x,i,points)
    prod = 1;
    [m ,n] =size(points);
    for j = 1:n
        if i~=j
            prod = prod*((x-points(j))/(points(i)-points(j)));
        end
    end

    val = prod;
end


