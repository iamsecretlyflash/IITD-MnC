a = [1 0 0 1; 1 1  0 2; 3 0.5 1 1];
[row,col] = size(a);
col = col-1;
for c = 1:col
        m = -10^100;ind = 1;
        for j = c:row
            m = max(m,a(j,c));
            if a(j,c) == m
                ind = j;
            end
        end
        ind
        temp = a(c,:);
        a(c,:) = a(ind,:);
        a(ind,:) = temp;
    for sub = c+1:row
        if sub~=c
         a(sub,:) = a(sub,:) - a(sub,c)*a(c,:)/a(c,c);
        end
    end
    a
    c
end


sols = zeros(1,row)
for c = col:-1:1
    sum = 0
    for j = col:-1:c+1
        sum = sum + a(c,j)*sols(j);
    end
    sols(c) = (a(c,end)-sum)/a(c,c);
end
sols