A = [1 1 -1; 1 2 2; -2 1 1];
b = [1;
     1;
     1];
[sz m] =size(A);
U = A;
L = eye(sz);
for i = 1:sz
    pivot = U(i,i);
    for j = i+1:sz
        L(j,i) = U(j,i)/pivot;
        if i ~=sz
            U(j,:) = U(j,:) - U(i,:)*U(j,i)/U(i,i);
        end
    end
end
L
U
%solving
y = zeros(1,sz);
for i = 1:sz
    y(i) = (b(i)/L(i,i))-dot(L(i,:),y);
end
y
x = zeros(1,sz);
for i = sz:-1:1
    x(i) = (y(i)/U(i,i)) - dot(U(i,:),x);
end
x