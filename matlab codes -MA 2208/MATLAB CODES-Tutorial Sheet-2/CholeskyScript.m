%This code is to find the Cholesky decomposition of a Symmetric Positive
%Definite Matrix

clc; clear;
A = input('Enter the matrix A:') %Read matrix A from the user; User ensure that 
                                 %your input is a positive definite matrix
%b = input('Enter the vector b:') %Read vector b from the user
[m,n]=size(A);                 %m and n are the matrix dimensions of A
if m~=n
    error('Matrix dimensions are not equal; Enter square matrix');
end
for i=1:n
    for j=1:n
        if A(i,j)~=A(j,i)
            error('Given matrix is not symmetric')
        end
    end
end
L = eye(m);
v = zeros(1,m);
D = diag(v);
D(1,1)=A(1,1);
for j=2:n   %Compute the first column of L
    L(j,1)= A(j,1)/D(1,1);
end
%L(2,1)=A(2,1)/D(1,1);
for i=2:n
    S1=0;
    for t=1:i-1
        S1=S1+L(i,t)^2*D(t,t);
    end
    D(i,i) = A(i,i)-S1;
    for j = i+1:n
        S2=0;
        for t=1:i-1
            S2=S2+L(j,t)*L(i,t)*D(t,t);
        end
        L(j,i) = (A(j,i)-S2)/D(i,i);
    end
    
    
end
disp('The matrix D in the Cholesky Factorization is')
disp(D)
disp('The matrix L in the Cholesky Factorization is')
disp(L)

    
        
