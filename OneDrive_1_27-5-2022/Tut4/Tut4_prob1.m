t_deg=[0,50,100,150,200,250,300,350];
y=[0.754,1.762,2.041,1.412,0.303,-0.484,-0.380,0.520];
t=pi*t_deg/180;
LHS_Mat=[length(t),   sum(sin(t));
         sum(sin(t)), sum(sin(t).^2)];
RHS_Vec=[sum(y);sum(y.*sin(t))];
C=LHS_Mat\RHS_Vec