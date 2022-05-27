%% MA2208-Numerical Methods (Dept. of Maths, Mahindra University)
%Problem 3, Tutorial 5
h=0.125;
a=0;b=1;
x=a:h:b;
f=@(x) sqrt(2/pi)*exp(-0.5*x.^2);
y=f(x);
I_simp=simpson_rule(x,y)

function I=simpson_rule(x,y)
h=x(2)-x(1);
I=(h/3)*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-1))+y(end));
end