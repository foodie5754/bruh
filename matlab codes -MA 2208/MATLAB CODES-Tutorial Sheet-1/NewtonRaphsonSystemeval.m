function [rootapprox, status] = NewtonRaphsonSystemeval(fun1,fun2,a,b)
%This ia code for NewtonRaphson method using feval
%for finding the roots of system of equations f(x,y)=0,g(x,y)=0 with intial 
%approximation a It givs the output 
%status=-1, if maxits reached

global tolerance maxits
global syms x y F G
%maxit-maximum number of iterations
%tolerance
iterations=0; % counter for iteration number
f_ab= eval(subs(fun1,[x,y],[a,b]));       %f_a= f(a)
g_ab= eval(subs(fun2,[x,y],[a,b]));
J=jacobian([fun1; fun2], [x y]);; %Symbolic function, these functions can evaluate by using eval subs.
while iterations<maxits  & norm([f_ab g_ab]',2)>tolerance
    iterations=iterations+1;
    Jinv = eval(subs(inv(J),[x y],[a b]));
     X= [a b]'-Jinv*[f_ab g_ab]' ;      %fdiff_a= f'(a)
     a = X(1)
     b=  X(2)
end

switch iterations
    case maxits
        status=-1;rootapprox=NaN;
    otherwise
        status=iterations; rootapprox=[a b];
end


end

