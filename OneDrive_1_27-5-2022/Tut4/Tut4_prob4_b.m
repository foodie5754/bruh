x0=3;
x=[0,1,2,4,5,6];
y=[1,14,15,5,6,19];
n=length(x);
D=zeros(n);
D(:,1) = y;
for j = 2:n
    for i = j:n
        D(i,j)=(D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
    end
end
fx0 = 0;
mult=1;
for i = 1:n
    fx0 =fx0 + mult*D(i,i);
    mult=mult*(x0-x(i));
end

fprintf('Approximation of f(3): %11.8f \n', fx0)