% Regula-Falsi method
% Clearing Screen
clc
clear
% Input Section
f=@(x) cos(x)-x.*exp(x);
a = 0; % initial guess 1
b = 1; % initial guess 2
e = 1e-8; % tolerance

% Finding Functional Value
fa = f(a);
fb = f(b);

% Implementing Bisection Method
if fa*fb > 0
    disp('Given initial values do not bracket the root.');
else
    c = a - (a-b) * fa/(fa-fb);
    fc = f(c);
    while abs(fc)>e
        fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
        if fa*fc< 0
            b =c;
            fb = fc;
        else
            a =c;
            fa = fc;
        end
        c = a - (a-b) * fa/(fa-fb);
        fc = f(c);
    end
    fprintf('\nRoot is: %f\n', c);
end
