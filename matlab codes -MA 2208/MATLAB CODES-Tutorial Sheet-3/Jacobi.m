function [X] = Jacobi(A,b,X0)
%this function finds a solution to Ax=b by Jacobi iteration.
%   
%maxit-Maximum number of iterations, must be natural number >1.
%X0   -Initial approximation to the solution

tol = 10e-6; %tol -tolerance; Assign some value to tol
maxit =15;  %Fixing maximum number of iterations to 100 

X0 = zeros(size(b));
m  = size(A,1); %'m' gives the number of equations in the linear system

X    = X0; 
A_it = zeros(size(A)); %A_it is the matrix useful in the iterations of the 
                       %Jacobi method to update an approximate solution
                       
 for i = 1:m       %for loop over row indices
     for j = 1:m   %for loop over column indices
         if i ~= j
             A_it(i,j) = -A(i,j)/A(i,i);
         end
     end
     b_it(i,:) = b(i,:)/A(i,i);  %b_it is the updated right-hand side 
                                    % would be used in the Jacobi iterations   
 end
 
 for k = 1:maxit  %for loop over iteration index
   %  size(A_it)        size(X0)           size(b_it)
     X = A_it * X0 + b_it;
     if norm(X-X0)/(norm(X0)+eps) < tol
         break;
     end
     X0=X;
 end    

end

