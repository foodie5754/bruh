clear;
clc;

%# Initials 
g=@(x) cos(x).*exp(-x);

tol=1e-5;
N=1000;

%# Initial iterations
x1 = 0;
x2 = g(x1);

iterations = 0;% # iteration counter
% iteration loop
while (abs(x2-x1) > tol && iterations<N)
    iterations = iterations + 1;
    x1 = x2;
    x2 = g(x1);
    if iterations==N
        error('Program reached the maximum number of iterations')
    end
end
fprintf('Found root is:%f\n',x2)
fprintf('Total number of iteration required: %d\n',iterations)
