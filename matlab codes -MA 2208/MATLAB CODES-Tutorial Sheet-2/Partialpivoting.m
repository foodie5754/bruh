function [AU] = Partialpivoting(A,i)
%This function applies partial pivoting to the coefficient matrix
%in Gaussian elimination 
%
m = size(A,1);
n = size(A,2)-1;
d = abs(A(i,i));
for k=i+1:m
    if d < abs(A(k,i))
       d = abs(A(k,i));
        pivotrow=k;
    end
end
%Swap Pivot row and current row
for j=i:n+1
    temp   = A(i,j);
    A(i,j) = A(pivotrow,j);
    A(pivotrow,j) = temp;
end
%        
AU=A;        

end

