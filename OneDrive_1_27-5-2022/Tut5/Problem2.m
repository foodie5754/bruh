%% MA2208-Numerical Methods (Dept. of Maths, Mahindra University)
%Problem 2, Tutorial 5
f=@(x) sin(x);
a=0;b=pi;
n=6;
x=linspace(0,pi,n+1);
y=f(x);
I_excat=2;
I_rect=comp_rectangle_rule(x,y)
pointwise_err=abs(I_excat-I_rect)

I_midp=comp_midpoint_rule(x,f)
pointwise_err=abs(I_excat-I_midp)

I_trap=comp_trapezoidal_rule(x,y)
pointwise_err=abs(I_excat-I_trap)

I_simp=comp_simpson_rule(x,y)
pointwise_err=abs(I_excat-I_simp)

function I=comp_rectangle_rule(x,y)
h=x(2)-x(1);
I=(h)*(sum(y(1:end-1)));
end

function I=comp_midpoint_rule(x,f)
h=x(2)-x(1);
y_mid=f(x(1:end-1)+h/2);
I=h*sum(y_mid);
end

function I=comp_trapezoidal_rule(x,y)
h=x(2)-x(1);
I=(h/2)*(y(1)+2*sum(y(2:end-1))+y(end));
end

function I=comp_simpson_rule(x,y)
h=x(2)-x(1);
I=(h/3)*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-1))+y(end));
end