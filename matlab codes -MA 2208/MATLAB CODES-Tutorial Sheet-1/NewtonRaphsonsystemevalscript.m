%This is a script file for executing NewtonRaphsonsystemeval.m
global tolerance maxits
tolerance=1e-1;
maxits=30;
a=1;b=2;
global syms x y F G
F= y*cos(x*y)+1;
G= sin(x*y)+x-y;
[rootapprox,status] = NewtonRaphsonSystemeval(F,G,a,b);
switch status
    case -1
        disp('Root finding failed')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end