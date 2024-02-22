display('Matrix A : ')
A= rand(10,10) % generating A using randn
display('Matrix b : ')
b=rand(10,1) % B using randn
U=A;
L=eye(10);

%Checking if LU decomposition exist
detA = det(A)
rankA = rank(A)
fprintf('\n')
ex = 1;
if detA ~=0
    for i = 1:10
        sub_mat = A(1:i,1:i);
        if det(sub_mat) == 0
            fprintf('%d Leading Principle Minor is 0\n LU Decomposition Does Not EXIST',i)
            ex = 0 ;
            break
        end
    end
end
if detA == 0
    for i = 1:rankA
        sub_mat = A(1:i,1:i);
        if det(sub_mat) == 0
            fprintf('%d Leading Principle is 0\n LU Decomposition Does Not EXIST',i)
            ex = 0 ;
            break
        end
    end
end
%below part calculated the LU decomposition using Doolittle's Method
if ex ~= 0
    for i=1:9
        max = 1;
        if U(i,i)==0 %pivoting
            max = 0;
            max_id = i;
            for k = i+1:10 %finding the max non-zero element in the column
                if abs(U(k,i))>max
                    max_id = k;
                    max = U(k,i);
                end
            end
            k = max_id;
            if U(k,i) ~= 0 %if 0 then move to the next row, column
                    v= U(k,:);
                    U(k,:)=U (i,:);
                    U(i,:) = v;
                    c=b(k,1);
                    b(k,1)=b(i,1);
                    b(i,1)=c;
             end
      
        end
        if max ~= 0 
            for j=i+1:10
                fij= U(j,i)/U(i,i);
                U(j,i:10)= U(j,i:10) - fij*U(i,i:10) ; 
                L(j,i)=fij; 
            end
        end
    end
    
    fprintf('LU Matrices : ')
    display(L)
    display(U)
    d=zeros(10,1);
    d(1,1) = b(1,1);
    for i =2:10
        d(i,1) = b(i,1) - dot(L(i,1:i-1),d(1:i-1));
    end
    
    X=zeros(10,1);
    
    X(10,1) = d(10,1)/U(10,10);
    for i = 9:-1:1
        X(i,1) = (d(i,1) - dot(U(i,i+1:10),X(i+1:10)))/U(i,i) ;
    end
    
    
    display("Answer by Doolittle’s decomposition")
    display(X)
    
    display("Matlab's answer by A/b")
    display(A\b)
end


