h=1/10;
a=0;
b=1;
n=(b-a)/h;
A=zeros(n-1);
A(1,1:2)=[-1-2/h^2,1/h^2];
A(n-1,n-2:n-1)=[1/h^2,-1-2/h^2];
for i=2:n-2
    A(i,i-1:i+1)=[1/h^2,-1-2/h^2,1/h^2];
end
x=a:h:b;
z=x(2:n)';
y=A\z;
yexact=@(x) 1/(exp(1)-exp(-1))*exp(x)-1/(exp(1)-exp(-1))*exp(-x)-x;
fplot(yexact,[0,1])
hold on
plot(x(2:n),y,'o')
err=abs(yexact(x(2:n))'-y)