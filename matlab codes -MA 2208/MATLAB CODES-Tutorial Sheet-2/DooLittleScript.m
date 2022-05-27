%This is a script file for Doolittle factorization of a given matrix


clc; clear;
A = input('Enter the matrix A:') %Read matrix A from the user
%b = input('Enter the vector b:') %Read vector b from the user
[m,n]=size(A);                 %m and n are the matrix dimensions of A
if m~=n
    error('Matrix dimensions are not equal; Enter square matrix');
end
L = eye(m);
U = eye(m);
%Compute first row of U
for j= 1:n
    U(1,j) =A(1,j);
end
%Compute first column of L
for i=1:n
    L(i,1) = A(i,1)/U(1,1);
end
%Compute 2,3,4,... nth row of U
for i=2:n       %i--index for row number
    for j=i:n   %j--index for column number
        S=0;
        for t=1:i-1 %t--index to compute the sum S;
            S=S+L(i,t)*U(t,j);
        end
        U(i,j)=A(i,j)-S; 
    end

%Compute the 2,3,4,---nth column of L

    for k=i:n  %k--row index to compute elements of L
        S=0;
        for t=1:i-1  %t--index to compute the sum S
            S = S+L(k,t)*U(t,i);
        end
        L(k,i) = (A(k,i)-S)/U(i,i);
    end
end
disp('The Lower triangular matrix is')
disp(L)
disp('The Upper Triangular Matrix is')
disp(U)

        
        
        
        
            
       
    