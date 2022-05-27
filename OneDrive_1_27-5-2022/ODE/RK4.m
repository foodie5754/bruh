clear
f=@(t,u) -2 .*t .*u.^2;
h=0.1;
a=0;b=1;
n=(b-a)/h;
uj=1; % u(x_0)=u(0)=1 is given 
for j=0:n-1
    tj=a+j*h;
    K1=h*f(tj,uj);
    K2=h*f(tj+0.5*h,uj+0.5*K1);
    K3=h*f(tj+0.5*h,uj+0.5*K2);
    K4=h*f(tj+h,uj+K3);
    uj=uj+(1/6)*(K1+2*K2+2*K3+K4) % u(x_(j+1))
end
