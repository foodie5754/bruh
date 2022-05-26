function [Poly,DivDiff] = NewtonDDPolynomial(x,y)
%This function gives coefficients of newton polynomial of degree n.
%Input: X=[x0 x1 x2 x3 x4 ....  xN]
%       Y=[y0 y1 y2 y3 y4 ....  yN]
%Output: Poly = Newton Polynomial coefficients of degree n
N = length(x);
DivDiff = zeros(N,N);
DivDiff(1:N,1) = y';
for k=2:N          %for loop over order of divided differences
   for m=1:N+1-k   %Divided Differences Table
       DivDiff(m,k) = (DivDiff(m+1,k-1)-DivDiff(m,k-1))/(x(m+k-1)-x(m));
   end
end

a = DivDiff(1,:); %first row of divided difference table
Poly = a(N);    %The Nth coefficient of polynomial is DivDiff(1,N)
for k=N-1:-1:1
    Poly = [Poly a(k)]-[0 Poly*x(k)];  %Poly(x)*(x-x(k-1))+a_k-1
 %The above expression computes the following polynomial recursively:
 %((a(N)(x-x(N-1))+a(N-1))((x-x(N-2))+a(N-2)+...
end

end

