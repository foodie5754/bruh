%This is a script file for executing secantfeval.m
global tolerance maxits
tolerance=1e-6;
maxits=30;
a=0;
b=1;
F=@(x) cos(x)-x*exp(x);
[rootapprox,status] = secantfeval(F,a,b);
switch status
    case -1
        disp('Root finding failed')
    case -2
        disp('Initial range does not have the root')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end

%In The following we are calling the secantfeval.m by using mathfun.m file

global tolerance maxits
tolerance=1e-6;
maxits=30;
a=0;
b=1;
[rootapprox,status] = secantfeval('mathfun',a,b);
switch status
    case -1
        disp('Root finding failed')
    case -2
        disp('Initial range does not have the root')
    otherwise
        s=sprintf("the approximate root %d found in %d number of iterations",rootapprox, status);
       disp(s)
end