%% Solving tri-diagonal system.
%
%  [ b(1)  c(1)                                  ] [  x(1)  ]   [  d(1)  ]
%  [ a(2)  b(2)  c(2)                            ] [  x(2)  ]   [  d(2)  ]
%  [       a(3)  b(3)  c(3)                      ] [   .    ]   [   .    ]
%  [            ...   ...   ...                  ] [   .    ] = [   .    ]
%  [                    ...    ...    ...        ] [   .    ]   [   .    ]
%  [                        a(n-1) b(n-1) c(n-1) ] [ x(n-1) ]   [ d(n-1) ]
%  [                                 a(n)  b(n)  ] [  x(n)  ]   [  d(n)  ]
%
%  a, b, c are vectors of length n, however, a(1) and c(n) are not in use)


%% the following portion should be known
% Define the vectors a, b, c and d. 
n=3;
a=zeros(n,1);
b=zeros(n,1);
c=zeros(n,1);
d=zeros(n,1);
b(1)=4;c(1)=-1;d(1)=-20;
a(2:n-1)=1;b(2:n-1)=-4;c(2:n-1)=1; d(2:n-1)=40;
a(n)=-1;b(n)=4;d(n)=-20;
%% method starts here
% Initialize x
x = zeros(n,1); 
% Forward elemination:
c(1)=c(1)/b(1);d(1)=d(1)/b(1);
for i=2:n-1
c(i)=c(i)/(b(i)-a(i)*c(i-1));
end
for i=2:n
d(i)=(d(i)-a(i)*d(i-1))/(b(i)-a(i)*c(i-1));
end
% Back substitution
x(n) = d(n);
for i=n-1:-1:1
        x(i) = d(i) - c(i)*x(i+1);
end