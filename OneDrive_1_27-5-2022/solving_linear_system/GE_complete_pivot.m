%% Solving system of equation using Gaussian elemination method.
clear
% Define the matrix A and the vector b. 
A = [1, 2, -1; 2, 1, -2; -3, 1, 1];
b= [3; 3; -6];     

% Find out the order of the matrix A
n= length(A); 

% Initialize x
x = zeros(n,1); 
x_ind=1:n;
% Forward elemination:
% Remember we need n-1 step for the elemination?? Therefore, k=1 to n-1.
for k=1:n-1

% Complete Pivoting
B=A(k:n,k:n);
[P,Q]=find(abs(B)==max(abs(B),[],'all'));
p=P(1)+k-1; q=Q(1)+k-1;

% interchange p-th and k-th row
A([k,p],:)=A([p,k],:); 
b([k,p])=b([p,k]);

% interchange q-th and k-th column
A(:,[q,k])=A(:,[k,q]);
x_ind([q,k])=x_ind([k,q]);


% Remember we need to eleminate x_k from E(k+1) to E(n)? Therfore j=k+1 to n.    
    for j=k+1:n
        % we need to calculate the multipliers.
        m = A(j,k)/A(k,k);
        % Performing E(j)=E(j)-m_(jk)*E(k)
        A(j,:) = A(j,:) - m*A(k,:);
           b(j)= b(j)-m*b(k);
    end
end
% back substitution
%%
% 
% $$x_n=\frac{b_n}{A_{nn}}$$
% 
x(x_ind(n)) = b(n)/A(n,n);

%%
% 
% $$x_i=\frac{b_i-\sum_{j=i+1}^{n}A_{i,j}x_j}{A_{ii}}$$
% 
for i=n-1:-1:1
        x(x_ind(i),:) = (b(i) - A(i,i+1:n)*x(x_ind(i+1:n)))/A(i,i);
end

disp(x)