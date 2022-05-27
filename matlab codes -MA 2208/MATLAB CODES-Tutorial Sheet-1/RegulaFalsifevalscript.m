%This is a script file for executing RegulaFalsi.m
global tolerance maxits
tolerance=1e-1;
maxits=5;
a=0;
b=1;
F=@(x) cos(x)-x*exp(x);
[rootapprox,status] = RegulaFalsi(F,a,b);
switch status
    case -1
        disp('Root finding failed')
    case -2
        disp('Initial range does not have the root')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end