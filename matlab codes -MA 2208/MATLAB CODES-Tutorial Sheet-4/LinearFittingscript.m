%A script file to fit ghe given data with a curve of the form
%y=c0+c1(Sin(X))
clc; clear;

x = input('Enter a vector X:') %Input X values in degrees
y = input('Enter a vector Y:') %Input Y values
x = degtorad(x);               %Converting X values in degrees into radians
%Compute the coefficient matrix in normal equations
Sin = sin(x);
A  = [sum(Sin.^2)  sum(Sin); sum(Sin) length(x)];
%Compute the right-hand side in normal equation
b =  [sum(y.*Sin);sum(y)];
%Solve the normal equations for unknowns
C =  A\b;
s=sprintf("The fitting curve is %d+%d Sin(x)",C(1),C(2));
disp(s)

