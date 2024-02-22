format longg
eq = find_poly([0,1.386294,1.609438,1.791759],[1,4,5,6])
val = get_value(2,eq,[1,4,5,6])
zeros(1,2)

function val = get_value(x,eq,b)
    val = eq(1);
    [m n] = size(eq);
    for i = 2:n
        v1 = 1;
        for j = 1:i-1
            v1 = v1*(x-b(j));
        end
        val = val+eq(i)*v1;
    end
end
function pol = find_poly(f,x)
    [m n] = size(x);
    b = zeros(1,n);
    b(1) = f(1);
    for i = 2:n
        b(i) = diff_rec(f(1:i),x(1:i));

    end
    pol = b;
    

end

function val = diff_rec(f,lst)
    s = size(lst);
    s = s(2);
    if s == 2
        val = (f(2) - f(1))/(lst(2)-lst(1));
        return 
    else
        val = ( diff_rec(f(2:s),lst(2:s)) -diff_rec(f(1:s-1),lst(1:s-1)) )/(lst(s)-lst(1));
        return
    end
end
    
