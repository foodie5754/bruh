function [AU,PC] = Fullpivoting(AU,i)
%This function applies Full pivoting to the coefficient matrix
%in Gaussian elimination 
%PC- column permutaion matrix
m = size(AU,1);
n = size(AU,2)-1;
A = AU(1:m,1:n);
%Find the maximum in each row
d = zeros(1,m);
Max_Col = zeros(1,m);
%i
AU
for j=i:m
    [d_1,Max_Col_1] = SortArray(A(j,i:n));
    d(j)=d_1;
    Max_Col(j)= i-1+Max_Col_1;
end
%Find the maximum element among row-wise maximum elements vector d
D=d(i:m);
[d_2,Max_Row] = SortArray(D);
    max_row_index = i-1+Max_Row;
    Max_Col;
for j=1:length(D)
   if d_2 == D(j)
        max_col_index = Max_Col(i-1+j);
        break
    end
end
%Swap max_row_index row and current row
for j=i:n+1
    temp   = AU(i,j);
    AU(i,j) = AU(max_row_index,j);
    AU(max_row_index,j) = temp;
end
AU
%Swap max_col_index column and current column
for j=i:m
    temp   = AU(j,i);
    AU(j,i) =  AU(j,max_col_index);
    AU(j,max_col_index)=temp;
end
max_col_index
AU
PC = eye(m,n);
%Output Column permutation matrix
if max_col_index~=i
PC(i,max_col_index) = 1;
PC(max_col_index,i) = 1;
PC(i,i)=0;
PC(max_col_index,max_col_index) =0;
end
end

