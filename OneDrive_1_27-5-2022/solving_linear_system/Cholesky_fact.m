function [L]=Cholesky_fact(A)
% we need to find L such that A=LL'.
n=length(A);
L=zeros(n);
for k=1:n
    L(k,k)=sqrt(A(k,k)-sum(L(k,1:k-1).^2)); % diagonals
    for j=k+1:n
        L(j,k)=(A(j,k)-L(j,1:k-1)*L(k,1:k-1)')/L(k,k);
    end
end
return