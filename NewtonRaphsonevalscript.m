%This is a script file for executing NewtonRaphsoneval.m
global tolerance maxits
tolerance=1e-1;
maxits=30;
a=0;
global syms x F
F= cos(x)-x*exp(x);
[rootapprox,status] = NewtonRaphsoneval(F,a);
switch status
    case -1
        disp('Root finding failed')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end