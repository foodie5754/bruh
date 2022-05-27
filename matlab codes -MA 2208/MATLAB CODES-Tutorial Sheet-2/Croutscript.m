%This is a script file for C factorization of a given matrix


clc; clear;
A = input('Enter the matrix A:') %Read matrix A from the user
%b = input('Enter the vector b:') %Read vector b from the user
[m,n]=size(A);                 %m and n are the matrix dimensions of A
if m~=n%Compute first row of U

    error('Matrix dimensions are not equal; Enter square matrix');
end
L = eye(m);
U = eye(m);
%Compute first column of L
for j=1:n
    L(j,1) = A(j,1);
end
for j= 1:n
    U(1,j) =A(1,j)/L(1,1);
end
%Compute 2,3,4,... nth columns of L
for j=2:n       %j--index for column number
    for i=j:n   %i--index for row number
        S=0;
        for t=1:j-1 %t--index to compute the sum S;
            S=S+L(i,t)*U(t,i);
        end
        L(i,j)=A(i,j)-S; 
    end

%Compute the 2,3,4,---nth rows of U

    for k=j:n  %k--column index to compute elements of U
        S=0;
        for t=1:j-1  %t--index to compute the sum S
            S = S+L(j,t)*U(t,j);
        end
        U(j,k) = (A(j,k)-S)/L(j,j);
    end
end
disp('The Lower triangular matrix is')
disp(L)
disp('The Upper Triangular Matrix is')
disp(U)

        
