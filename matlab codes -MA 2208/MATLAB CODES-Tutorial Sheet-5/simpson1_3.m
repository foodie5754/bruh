function [integral]=simpson1_3(a,b,n,f)
%  function [integral]=simpson(a,b,n,f)
%
%  This uses the simpson 1/3 rule with n subdivisions to  
%  integrate the function f over the interval [a,b].  The 
%  function "f" represents the integrand function.

% Initialize for Simpson integration.
sumend = f(a) + f(b);
sumodd = 0;
sumeven = 0;

% Initialize for case of n0 > 2.
if(n > 2)
    h = (b-a)/n;
    for i=2:2:n-2
        sumeven = sumeven + f(a+i*h);
    end
end

%  Calculate the numerical integrals, doing each
%  by appropriately modifying the preceding case.

sumodd = 0;

    for k=1:2:n-1
        sumodd = sumodd + f(a+k*h);
    end
    integral = h*(sumend + 4*sumodd + 2*sumeven)/3;
end

