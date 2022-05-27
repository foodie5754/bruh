function [d,Max_Col] = SortArray(A)
% This function gives maximum element of an array and its index
%   d-Maximum element of an array
%Max_Col- Index of a maximum element
m=length(A);
Max_Col =1;
d = abs(A(1));
    for k=2:m
        if k == 2 & m~=2
        d = abs(A(1));
        Max_Col =1;
        end
        if d < abs(A(k))
            d = abs(A(k));
            Max_Col=k; %Max_col(j) gives the column number in which the j^th row has
            % maximum element
        end
    end
s=sprintf("Maximum element of an array is %d at %d index", d,Max_Col);
disp(s)
end

