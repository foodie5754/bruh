function [Lcoeff,LPolynomial] = LagrangePolynomial(x,y)
%This function gives coefficients of Lagrange polynomial of degree n.
%Input: X=[x0 x1 x2 x3 x4 ....  xN]
%       Y=[y0 y1 y2 y3 y4 ....  yN]
%Output: LPolynomial = Lagrange coefficient polynomial L_{N,m}(x) 
N = length(x);
Lcoeff = 0;
for m=1:N
    P =1;
    for k=1:N+1
        if k~=m
            P = conv(P,[1 -x(k)])/(x(m)-x(k));
        end
    end
    LPolynomial(m,:) =P;   % Lagrange coefficient polynomial
    Lcoeff = Lcoeff+y(m)*P % Lagrange Polynomial
end

    
end

