function [X] = GaussSeidel(A,b,X0)
%this function finds solution of Ax=b by Gauss-Seidel iteration
%   
%maxit-Maximum number of iterations, must be natural number >1.
%X0   -Initial approximation to the solution

tol = 10e-6; %tol -tolerance; Assign some value to tol
maxit =15;  %Fixing maximum number of iterations to 100 

X0 = zeros(size(b));
m  = size(A,1); %'m' gives the number of equations in the linear system

X    = X0; 

for k=1:maxit
    X(1,:) = (b(1,:)-A(1,2:m)*X(2:m,:))/A(1,1);
    for i=2:m-1  %For loop over equations
        tmp = b(i,:)-A(i,1:i-1)*X(1:i-1,:)-A(i,i+1:m)*X(i+1:m,:);
        X(i,:)= tmp/A(i,i);
    end
    X(m,:) = (b(m,:)-A(m,1:m-1)*X(1:m-1,:))/A(m,m);
    if norm(X-X0)/(norm(X0)+eps) < tol
         break;
     end
     X0=X;
end



end

