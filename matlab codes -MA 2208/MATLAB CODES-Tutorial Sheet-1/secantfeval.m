function [rootapprox,status] = secantfeval(fun,a,b)
%This ia code for secant method for finding the roots of f(x)=0 with intial 
%approximations a and b 
%status=-1, if maxits reached
%status=-2, if f_a*f_b>0
global tolerance maxits
%maxit-maximum number of iterations
%tolerance
iterations=0; % counter for iteration number
while iterations<maxits  & abs(b-a)>tolerance
    iterations=iterations+1;
    f_a= feval(fun,a);         %f_a= f(a)
    f_b= feval(fun,b);         %f_b= f(b)
    c=a-f_a*(b-a)/(f_b-f_a);
    a=b;b=c;
end

switch iterations
    case maxits
        status=-1;rootapprox=NaN;
    case 0
        status=-2;rootapprox=NaN;
    otherwise
        status=iterations; rootapprox=c;
end

end

