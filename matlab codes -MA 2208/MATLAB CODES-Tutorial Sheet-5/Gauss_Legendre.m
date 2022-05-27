function [integral] = Gauss_Legendre(n,f)
%
%function [integral] = Gauss-Legendre(a,b,n,f)
%
%  This uses the Legendre Polynomaialof degree n to  
%  integrate the function f over the interval [-1,1].  The 
%  function "f" represents the integrand function and it is a MATLAB 
%  symbolic function.

% Initialize for Legendre integration.
syms x
Roots = vpasolve(legendreP(n,x) == 0) %vpasolve find the roots of the symbolic
                                      %Legendre polynomial of degree n
                                    
f_values = arrayfun(f,Roots)
%B = arrayfun(func,A) applies the function func to the elements of A, 
%one element at a time. arrayfun then concatenates the outputs from func 
%into the output array B, so that for the ith element of A, B(i) = func(A(i)).

%calculate weights in Legendre quadrature rule:
weight_Formula_Function =  2/((1-x^2)*diff(legendreP(n,x),1)^2)

 g = matlabFunction(weight_Formula_Function)%Creates function handle

weights = arrayfun(g,Roots)

  integral = sum(weights.*f_values);

end

