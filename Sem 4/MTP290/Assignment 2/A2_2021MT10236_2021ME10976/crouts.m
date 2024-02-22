a = [1 2 3;
     3 20 26;
     3 26 70];
n = 3
L = zeros(n);
U = eye(n);
for i = 1:n
    L(i,1) = a(i,1);
    U(1,i) = a(1,i)/L(1,1);
end
for j = 2:n-1
    for i = j:n
        s = 0;
        for k = 1:j-1
            s = s+L(i,k)*U(k,j);
        end
        L(i,j) = a(i,j) - s;
    end


    for k = j+1:n
        s = 0;
        for i = 1:j-1
            s = s+ L(j,i)*U(i,k);
        end
        U(j,k) = (a(j,k) - s)/L(j,j);
    end
end
s = 0
for i = 1:n-1
    s = s + L(n,i)*U(i,n)
end
L(n,n) = a(n,n) - s;
L
U
L*U