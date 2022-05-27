clear
f=@(t,u) -2 .*t .*u.^2;
h=0.1;
a=0;b=1;
n=(b-a)/h;
uj=1; % u(0)=1 is given
for j=0:n-1
    tj=a+j*h;
    K1=h*f(tj,uj);
    K2=h*f(tj+h,uj+K1);
    uj=uj+(1/2)*(K1+K2)
end
