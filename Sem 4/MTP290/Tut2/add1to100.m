a = sum(100)
b = sumEven(100)
c = findMax(1,-1,2)
d = findNum(10)
function a = sum(n)
    a = n*(n+1)/2;
end

function a = sumEven(n)
    k = n/2;
    a = (k)*(k+1);
end

function max = findMax(a,b,c)
    m1 = (abs(a-b) + abs(a+b))/2;
    max = (abs(m1-c) + abs(m1+c))/2;
end

function num = findNum(dig)
    digits = 0 ;
    n  = 0;
    fact = 1;
    while digits<dig
        n = n+1;
        fact = fact*n
        digits = floor(log10(fact)+1)
    end
    num = n;
end