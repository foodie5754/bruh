x=[1,2,3,4];
fx=[1.65,2.70,4.5,7.35];
y=log10(fx);
LHS_Mat=[length(x),sum(x);sum(x),sum(x.^2)];
RHS_Vec=[sum(y);sum(y.*x)];
C=LHS_Mat\RHS_Vec;
a=10^C(1)
b=C(2)/log10(exp(1))
