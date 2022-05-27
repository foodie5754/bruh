%This is a script file for executing Fixedpoineval.m
global tolerance maxits
tolerance=1e-3;
maxits=300;
a=0;
global syms x F
F= cos(x)/exp(x);
[rootapprox,status] = Fixedpointeval(F,a);
switch status
    case -1
        disp('Root finding failed')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end