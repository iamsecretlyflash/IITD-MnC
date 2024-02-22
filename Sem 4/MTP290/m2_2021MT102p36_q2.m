format longg
y = [4,7,8,11,15]; %(y0,y1,y2,y3,y4)
x = [2,3,4,5,6]; %(x0,x1,x2,x3,x4)
plot(x,y)
fprintf('\nvalue of approximated polynomial at x = 4.5 : ')
display(find_val(4.5,y,x))
fprintf('\nf[x3,x2,x1,x0] :')
disp(div_recc(y(1:end-1),x(1:end-1)))
fprintf('\nf[x2,x1,x0] :')
disp(div_recc(y(1:3),x(1:3)))
fprintf('\nf[x3,x2,x1] :')
disp(div_recc(y(2:4),x(2:4)))

xx = linspace(0,8);
yy = zeros(100);
for i = 1:100
    yy(i) = find_val(xx(i),y,x);
end
plot(xx,yy)
function val = find_val(x,y,points)
    val = y(1);
    [m, n] = size(points);
    for i = 2:n
        prod = 1;
        for j = 1:i-1
            prod = prod*(x-points(j));
        end
        val = val + prod*div_recc(y(1:i),points(1:i));
    end
end
function val = div_recc(y,points)
    [m, n] = size(points);
    if n == 2
        val = (y(2)-y(1))/(points(2)-points(1));
        return
    else
        val = (div_recc(y(2:end),points(2:end)) -div_recc(y(1:end-1),points(1:end-1)))/(points(end)-points(1));
        return
    end
end

