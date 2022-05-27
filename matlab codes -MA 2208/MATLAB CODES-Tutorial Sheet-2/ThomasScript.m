%This Script for executing the Thomas algorithm; Gaussian elimination for
%the Tridiagoanl System

clc;clear;
T = input('Enter the matrix T:') %Read matrix A from the user; User ensure that 
                                 %your input is a positive definite matrix
D = input('Enter the vector D:') %Read vector b from the user
[m,n]=size(T);                 %m and n are the matrix dimensions of A
if m~=n
    error('Matrix dimensions are not equal; Enter square matrix');
end
%Create vectors for the entries of a Tridiagonal matrix
A=zeros(1,m);B=zeros(1,m);C=zeros(1,m);   
X=zeros(m,1);  % A solution vector for the given tridiagonal system
for i=1:m-1
    A(i+1)= T(i+1,i);
    C(i)  = T(i,i+1);
    B(i)  = T(i,i);
end
B(m) = T(m,m);
%Here P and Q are upper triangular elements of a Tridiagonal matrix
P = zeros(m,1); Q = zeros(m,1); 
P(1) = -C(1)/B(1);
Q(1) =  D(1)/B(1);
i=2;
while i<=m
    Denominator = B(i)+A(i)*P(i-1);
    P(i) = -C(i)/Denominator;
    Q(i) = (D(i)-A(i)*Q(i-1))/Denominator;
    i=i+1;
end
%Back Substitution
X(m) = Q(m);
for i=m-1:-1:1
    X(i)=P(i)*X(i+1)+Q(i);
end
disp('The solution vector is')
disp(X)
% disp(A)
% disp(B)
% disp(C)


    
