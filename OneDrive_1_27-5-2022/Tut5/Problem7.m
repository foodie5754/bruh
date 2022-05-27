%% MA2208-Numerical Methods (Dept. of Maths, Mahindra University)
%Problem 7, Tutorial 5

f=@(t) 0.5*cos(t+5)./(1+sin(0.5*(t+5)));

nodes_2=[-sqrt(1/3),sqrt(1/3)];
weights_2=[1,1];

nodes_3=[-sqrt(3/5),0,sqrt(3/5)];
weights_3=[5/9,8/9,5/9];

I_GL2=weights_2*f(nodes_2)'
I_GL3=weights_3*f(nodes_3)'
