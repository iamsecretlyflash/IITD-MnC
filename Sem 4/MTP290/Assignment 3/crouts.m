A = [1 2 3;
     4 5 6 ;
     7 8 10 ];
[n , m] = size(A);

L = zeros(n);
U = eye(n);

for i = 1:n
    L(i,1) = A(i,1);
end
for i = 2:n
    U(1,i) = A(1,i)/L(1,1);
end
for j = 2:n-1
    for i = j:n
        sum = 0;
        for k = 1:j-1
            sum = sum + L(i,k)*U(k,j);
        end
        L(i,j) = A(i,j) - sum;
    end

    for k = j+1:n
        sum = 0;
        for i = 1:j-1
            sum = sum + L(j,i)*U(i,k);
        end
        U(j,k) = (A(j,k) - sum)/L(j,j);
    end
end
sum = 0;
for i = 1:n-1
    sum = sum + L(n,i)*U(i,n);
end
L(n,n) = A(n,n) - sum;
L
U