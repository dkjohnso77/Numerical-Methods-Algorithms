function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin <2 || nargin >2
   error('Wrong number of input arguments');
end

A = zeros(n,m);

% Now the real challenge is to fill in the correct values of A

for j = 1:m % (creating loop starting with 1 through value of m)
    for i = 1:n % (creating loop starting with 1 through value of n)
        if j == 1 % Setting up column 1 (1 to m)
            A(i,j) = i;
        elseif i == 1 % Setting up row 1 (1 to n)
            A(i,j) = j;
        else % Setting up remaining matrix values:
            A(i,j) = A(i, j-1)+ A(i-1,j);
            % 2nd iteration as example: A(i, j-1)+ A(i-1,j) equates to 
            %A(row 2, column1) + A(row1, column2)
        end
    end
end
% Things beyond here are outside of your function
