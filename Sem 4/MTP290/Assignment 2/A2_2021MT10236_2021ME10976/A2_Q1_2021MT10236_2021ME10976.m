A = [ 9 3 2 0 7; 
      7 6 9 6 4;
      2 7 7 8 2;
      0 9 7 2 2;
      7 3 6 4 3];
B = [35;
     58;
     53;
     37;
     39];

ans_met = gauss_elimination(A,B);
ans_sys = A\B;
fprintf('Roots using Gauss Elimination with Partial Pivoting :\nx1 = %d, x2 = %d, x3 = %d, x4 = %d, x5 = %d',ans_met(1),ans_met(2),ans_met(3),ans_met(4),ans_met(5))
fprintf('\n\nRoots using MATLABs in-built calculator: \nx1 = %d, x2 = %d, x3 = %d, x4 = %d, x5 = %d\n',ans_sys(1),ans_sys(2),ans_sys(3),ans_sys(4),ans_sys(5))
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
    max_id = i;
    [n m] = size(X);
    max_el = X(i,i);
    for row = 1:n %checking for max element in the row
        if max_el < X(row,i)
            max_el = X(row,i);
            max_id= row;
        end
    end

    temp = X(i,:);
    X(i,:) = X(max_id,:);
    X(max_id,:) = temp;
end

function X = gauss_jordan(X,i,j)
    [n , m ] = size(X);
    for r = 1:n 
        if r~=i
            X(r,:) = X(r,:) - X(r,i)*X(i,:)/X(i,i);   
        end
    end
    X(i,:) = X(i,:)/X(i,i);
end