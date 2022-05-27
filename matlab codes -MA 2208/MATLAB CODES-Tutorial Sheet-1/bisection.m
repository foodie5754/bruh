function [rootapprox,status] = bisection(fun,a,b)
%This ia code for bisection method for finding the roots of f(x)=0 with intial 
%approximations a and b 
%status=-1, if maxits reached
%status=-2, if f_a*f_b>0
global tolerance maxits
%maxit-maximum number of iterations
%tolerance
iterations=0;% counter for iteration number
f_a= feval(fun,a);         %f_a= f(a)
f_b= feval(fun,b);          %f_b= f(b)
while(f_a*f_b<0) & iterations<maxits & (b-a)>tolerance
    iterations=iterations+1;
    c=(a+b)/2 ;  %Updated approximation
    f_c=feval(fun,c);  %f_c=f(c)
    if f_c*f_a<0
        b=c; f_b=f_c;
    elseif f_c*f_b<0
        a=c; f_a=f_c;
    else
        rootapprox=c;
    end
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

