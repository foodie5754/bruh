%A script file to fit ghe given data with a curve of the form
%y=a*exp(bx)
clc; clear

x = input('Enter a vector X:') %Input X values 
y = input('Enter a vector Y:') %Input Y values
%Compute the values of logy base 10 values
LYB10= log(y)/log(10);
%Compute the coefficient matrix in normal equations
A  = [sum(x.^2)  sum(x); sum(x) length(x)]
%Compute the right-hand side in normal equation
b =  [sum(x.*LYB10);sum(LYB10)]
%Solve the normal equations for unknowns
C =  A\b;
a = 10^C(2);    % Because A = log a base 10
b = C(1)*log(10); % Because B = b* log e base 10
s=sprintf("The fitting curve is %d*exp(%d*x)",a,b);
disp(s)