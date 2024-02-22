x_cord = [0,0.12,0.22,0.32,0.36,0.40,0.44,0.54,0.64,0.70,0.80,0.90];
[m , n] = size(x_cord);
st = 0;
diff = 0;
to = 0;
i = 2;
while i<=n
    if diff ==  0
        st = i-1;
        to = i;
        diff = x_cord(i) - x_cord(i-1);
        i = i+1;
    else 
        if abs(diff - (x_cord(i)-x_cord(i-1)))<0.0000001
            to = i;
            i  = i+1;
        else
            fprintf("\nPrinting %d to %d\n",st,to);
            diff = 0;
        end
    end
     
end
fprintf("%d %d\n",st,to)
