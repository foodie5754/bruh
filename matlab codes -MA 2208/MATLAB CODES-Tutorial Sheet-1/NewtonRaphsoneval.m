function [rootapprox,status] = NewtonRaphsoneval(fun,a)
%This ia code for NewtonRaphson method using feval
%for finding the roots of f(x)=0 with intial 
%approximation a It givs the output 
%status=-1, if maxits reached

global tolerance maxits
global syms x F
%maxit-maximum number of iterations
%tolerance
iterations=0; % counter for iteration number
f_a= eval(subs(fun,x,a));       %f_a= f(a)
fdiff = diff(fun,x); %Symbolic function, these functions can evaluate by using eval subs.
while iterations<maxits  & abs(f_a)>tolerance
    iterations=iterations+1;
    fdiff_a= eval(subs(fdiff,x,a));         %fdiff_a= f'(a)
    b=a-f_a/fdiff_a;
    a=b;
    f_a= eval(subs(fun,x,a));         %f_a= f(a)
end

switch iterations
    case maxits
        status=-1;rootapprox=NaN;
    otherwise
        status=iterations; rootapprox=a;
end


end

