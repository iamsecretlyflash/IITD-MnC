function C = gauss_elimination(A,B)
    i = 1; % loop variable
    X = [ A B ]; % Augumented matrix
    [ n, m ] = size(X); % size of matrix   
    while i <= n
        if X(i,i) == 0 % checking if the diagonal elements are zero or not
            X = pivot(X, i); % code your own
        end
        X = gauss_jordan(X,i,i); % code your own
        i = i +1;
    end    
    C = X(:,m);
end

function X = pivot(X, i)
    r = i;
    [n m] = size(X);
    max_el = X(i,i);
    for row = 1:n
        if max_el < X(row,i)
            max_el = X(row,i);
            r = row;
        end
    end

    temp = X(i,:);
    X(i,:) = X(r,:);
    X(r,:) = temp;
end

function X = gauss_jordan(X,i,j)
    [n , m ] = size(X);
    for r = 1:n
        if r~=i
            X(r,:) = X(r,:) - X(r,i)*X(i,:)/X(i,i);   
        end
    end
    X(i,:) = X(i,:)/X(i,i)
end