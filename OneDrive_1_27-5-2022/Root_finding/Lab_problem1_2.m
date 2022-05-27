% Regula-Falsi method
% Clearing Screen
clc;clear

%# Initials 
f=@(x) cos(x)-x.*exp(x);
a = 0; % initial guess 1
b = 1; % initial guess 2
e = 1e-8; % tolerance

% Finding Functional Value
fa = f(a);
fb = f(b);

c = a - (a-b) * fa/(fa-fb);
fc = f(c);
while abs(fc)>e
    fprintf('%f\t%f\n',c,fc);
    a =b;
    b =c;
    fa = fb;
    fb = fc;
    c = a - (a-b) * fa/(fa-fb);
    fc = f(c);
end
fprintf('\nRoot is: %f\n', c);

