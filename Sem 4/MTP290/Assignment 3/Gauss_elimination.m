A = [1 2 3 10;
     4 5 6 11;
     7 8 10 12];
[n ,m] = size(A);

for i = 1:n
    %find max element
    max = A(i,i);
    max_ind = i;
    for j = i+1:n
        if j ~= i
            if A(j,i)>max
                max_ind = j;
                max = A(j,i);
            end
        end
    end
    
    temp = A(i,:);
    A(i,:) = A(max_ind,:);
    A(max_ind,:) = temp;

    for j = 1:n
        if j~=i
            A(j,:) = A(j,:) - A(i,:)*(A(j,i)/A(i,i));
        end
    end

end

%backward substitution
roots = zeros(1,n);
for i = n : -1 :1
    root = A(i,m) - dot(roots,A(i,1:n));
    roots(i) = root/A(i,i);
end
roots
