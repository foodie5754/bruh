clear
f=@(t,u) -2 .*t .*u.^2;
h=0.1;
a=0;b=1;
n=(b-a)/h;
uj=1; % u(0)=1 is given
for j=0:n-1
    tj=a+j*h;
    uj=uj+h*f(tj,uj)
end
