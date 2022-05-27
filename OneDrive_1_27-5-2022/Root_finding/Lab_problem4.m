% Secant Method in MATLAB
clc;clear
% syms x
% f= 230*x^4+18*x^3+9*x^2-221*x-9;

f=@(x) 230*x^4+18*x^3+9*x^2-221*x-9;

x(1)=0;
x(2)=1;
tol=1e-3;
N=1000;
iteration=0;

for i=3:N
   x(i) = x(i-1) - (f(x(i-1)))*((x(i-1) - x(i-2))/(f(x(i-1)) - f(x(i-2))));
    iteration=iteration+1;
    if abs(f(x(i)))<tol
        root=x(i)
        iteration
        break
    end
end
