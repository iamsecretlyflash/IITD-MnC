A = [ 6 15 55;
      15  55 255;
      55 255 979]

L = zeros(3);
L(1,1) = sqrt(A(1,1));
for k = 1:n
    sum = 0;
    for i =1:k-1
        sum = sum + L(k,i)^2;
    end
    L(k,k) = sqrt(A(k,k)-sum);
    for i = 1:k-1
        sum = 0;
        for j = 1:i-1
            sum = sum +L(i,j)*L(k,j);
        end
        L(k,i) = (A(k,i) - sum)/L(i,i);
    end

end
L*transpose(L)


