x=[0,1,2,4,5,6];
y=[1,14,15,5,6,19];
xq=1.5 ;
yq=lagrange_interpolation(x,y,xq)
function yq=lagrange_interpolation(x,y,xq)
n=length(x);
for i=1:n
    mult=1;
    for j=1:n
        if (i~=j)
            mult=mult*(xq-x(j))/(x(i)-x(j));
        end
    end
    L(i)=mult;
end
sum=0;
for i=1:n
    sum=sum+y(i)*L(i);
end
yq=sum;
end
