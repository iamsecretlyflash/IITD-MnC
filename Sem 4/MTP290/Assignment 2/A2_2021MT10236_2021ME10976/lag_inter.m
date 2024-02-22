func_approx(2,[0,1.386294,1.609438,1.791759],[1,4,5,6])

function val = func_approx(x,f,points)
    val = 0;
    [m n] = size(points);
    for i = 1:n
        val = val + Li(x,i,points)*f(i);
    end
end

function val = Li(x,i,points)
    [m n] = size(points)
    val = 1;
    for j = 1:n
        if j ~= i
            val = val*(x-points(j))/(points(i)-points(j));
        end
    end
end