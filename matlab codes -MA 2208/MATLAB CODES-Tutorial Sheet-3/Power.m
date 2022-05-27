function [lambda,v] = Power(A,x,tol,maxit)
%This function uses Power method to compute its dominant eigenvalue
%A is a matrix, x is a starting vector, maxit-Maximum Iterations,
%tol-Tolerance
x = x(:); 
lambda = norm(A*x)/norm(x);
for k = 1:maxit
    x1 = x
    lambda1 = lambda;
    x = A*x./x;
    [xm,m] = max(abs(x));
    lambda =x(m)%the component with largest magnitude (absolute value)
    if norm(x1-x)< tol & abs(lambda1-lambda)<tol
        break;
    end
end
if k==maxit
    disp('Warning:Increase Maximum iteration');
end
v = x/norm(x);
    
end

