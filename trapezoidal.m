function [integral]=trapezoidal(a,b,n,f)
%  function [integral]=trapezoidal(a,b,n,f)
%
%  This uses the trapezoidal rule with n subdivisions to  
%  integrate the function f over the interval [a,b].  The 
%  function "f" represents the integrand function. 
  

% Initialize for trapezoidal rule.
sumend = (f(a) +f(b))/2;
sum = 0;

%  Initialize for case of n > 2.
if(n > 2)
    h = (b-a)/n;
    for i=1:n-1
        sum = sum + f(a+i*h);
    end
end

integral = h*(sumend + sum);
end

