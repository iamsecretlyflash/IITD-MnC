format longg
get_root()
function root = get_root()
    xL = -2.5; xU = -1.0;       % assigning intial values of the interval
    xR = get_new(xU,xL);        % inital guess of the root
    tol = 100;                  % initial tolerance = 100%
    while tol>0.1               % tolerance limit = 1%
        if f(xR)*f(xL) < 0 
            xU = xR;
        else
            xL = xR;
        end
        xRn = get_new(xU,xL);                   % new root = intersection of line joining (xu,f(xu)) and (xl,f(xl)) with the X axis
        tol = 100*abs(xR-xRn)/abs(xRn);
        xR = xRn;
    end
    root = xR;
end


function val = get_new(xU,xL) 
    val = xU - ((f(xU)*(xL-xU))/(f(xL)-f(xU)));     % intersection point
end

function val = f(x)
    val = (x-4)*(x-4)*(x+2);            % evaluation of given function
end