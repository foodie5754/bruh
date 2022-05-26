function [rootapprox,status] = Fixedpointeval(fun,a)
%This ia code for Fixedpoint method using feval
%for finding the roots of x-f(x)=0 with intial 
%approximation a It givs the output 
%status=-1, if maxits reached

global tolerance maxits
global syms x F
%maxit-maximum number of iterations
%tolerance
iterations=0; % counter for iteration number
f_a= eval(subs(fun,x,a))       %f_a= f(a)
%fdiff = diff(fun,x); %Symbolic function, these functions can evaluate by using eval subs.
while iterations<maxits  & abs(a-f_a)>tolerance
    iterations=iterations+1;
    b=f_a;   
    f_a= eval(subs(fun,x,b));         %f_a= f(b)
end

switch iterations
    case maxits
        status=-1;rootapprox=NaN;
    otherwise
        status=iterations; rootapprox=a;
end


end

