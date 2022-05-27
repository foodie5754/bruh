%% MA2208-Numerical Methods (Dept. of Maths, Mahindra University)
%Problem 1, Tutorial 5

t=[0,10,20,30,40,50,60,70,80];
a=[30,31.63,33.34,35.47,37.75,40.33,43.25,46.69,50.67];

I_simp=simpson_rule(t,a)

function I=simpson_rule(x,y)
h=x(2)-x(1);
I=(h/3)*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-1))+y(end));
end