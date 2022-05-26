function [u,x] = BVP(xf,yx0,yxf,h)
%This function solves the equation y_xx=y+x using finite difference method
%0<=x<=xf and h=Step Size.
%Initial Condition:y(0)=yx0, y(xf)=yxf
%   
x = [0:h:xf];
m = length(x);
for i =1:m-2
    A(i,i) = -(2/h^2)-1;
    if i >1
        A(i,i-1)= 1/h^2;
        A(i-1,i)= 1/h^2;
    end
end
b=x';
%b(1,:) = b(1,:)-(1/h^2)*yx0;
%b(m,:) = b(m,:)-(1/h^2)*yxf;
b=b(2:m-1,:);

A
b
u = A\b;
u = [yx0 u' yxf];
disp('The solution at nodes is')
disp(u);
    
end

