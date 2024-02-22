a = [16 4 4 -4;
     4 10 4 2;
     4 4 6 -2;
     -4 2 -2 4];

L = zeros(4);
for k = 1:4
    for i = 1:k-1
        s = 0;
        for j = 1:i-1
            s = s+L(i,j)*L(k,j);
        end
        L(k,i) = (a(k,i) - s)/L(i,i);
    end

    s = 0;
    for i = 1:k-1
        s = s+L(k,i)*L(k,i);
    end
    L(k,k) = sqrt(a(k,k) - s);

    

end
L*transpose(L)
L
