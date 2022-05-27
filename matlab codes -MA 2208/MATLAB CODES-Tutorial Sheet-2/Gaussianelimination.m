function [output,Status] = Gaussianelimination(A,b)
%This function solves the system of equations using Ax=b using Gaussian
%elimination
%   
[m,n] = size(A);
AU = [A b];
%Tens = zeros(m,n,m-1);     % Uncomment in Complete pivoting
for i=1:m
     if AU(i,i) == 0 
       disp('Gauss elimination method can not applicable. Rearrange the equations!!!');
       %Diagonal element zero. Hence pivote can't be calculated.
       return
     end
end
%The following lines of code zeroing the lower triangle elements
for i=1:m-1 %row index
%    [AU,PC] = Fullpivoting(AU,i); % Uncomment if Complete pivoting
%    Tens(:,:,i)=PC;                  %Uncomment if Complete pivoting
   %AU = Partialpivoting(AU,i);    %Uncomment if partial pivoting
    for j=i+1:m
        p = AU(j,i)/AU(i,i);
        AU( j, :)= AU(j,:)-p*AU(i,:);
    end
end
AU  %Displays the matrix AU.
d=AU(m,m);
x=zeros(m,1);
x(m)=AU(m,n+1)/d;
for i=m-1:-1:1
    %Compute the sum s here
    s=0;
    for j=i+1:n
        s=s+AU(i,j)*x(j);
    end
    x(i)=(AU(i,n+1)-s)/AU(i,i);
  %x =  Tens(:,:,i)*x; %Uncomment in cas eof complete pivoting
end



disp(x);
output=x;
end

