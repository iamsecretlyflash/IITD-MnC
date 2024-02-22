A = [1 2 3 11;
     4 5 6 12;
     7 8 10 13];
[n , m] = size(A);

L = eye(n);
for i = 1:n
    for j = i+1 : n
        L(j,i) = A(j,i)/A(i,i);
        A(j,:) = A(j,:) -A(i,:)*(A(j,i)/A(i,i));
    end
end
L
A