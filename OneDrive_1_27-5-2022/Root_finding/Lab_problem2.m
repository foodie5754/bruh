% Define the function, Jacobian
% We assume X=[x;y], that means x=X(1) and y=X(2)
F=@(X) [X(2)*cos(X(1)*X(2))+1;
        sin(X(1)*X(2))+X(1)-X(2)];
J=@(X) [-X(2)^2*sin(X(1)*X(2)),   cos(X(1)*X(2))-X(1)*X(2)*sin(X(1)*X(2));
         X(2)*cos(X(1)*X(2))+1,   X(1)*cos(X(1)*X(2))-1];
% other inputs
tol=1e-4;
N=1000;
X0=[1;2];
% Initialise X1;
for i=1:N
    % the method
    X1=X0-inv(J(X0))*F(X0);  % Use 'X1=X0-J(X0)\F(X0);' for faster clculation
    % stopping criterion
    if norm(X1-X0,Inf)<tol
        disp("The root is")
        disp(X1)
        break;
    end
    % prepare for next iteration
    X0=X1;
end
if i==N
    disp('method fails')
end