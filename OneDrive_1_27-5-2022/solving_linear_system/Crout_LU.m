function [L,U]=Crout_LU(A)
n=length(A);
L=zeros(n);
U=zeros(n);
for k=1:n
    U(k,k)=1; % diagonal of U should be 1.
    for j=k:n
        L(j,k)=(A(j,k)-L(j,1:k-1)*U(1:k-1,k))/U(k,k);
    end
    for j=k+1:n
        U(k,j)=(A(k,j)-L(k,1:k-1)*U(1:k-1,j))/L(k,k);
    end
end
return