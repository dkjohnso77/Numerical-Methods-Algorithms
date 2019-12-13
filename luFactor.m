function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
if ~ismatrix(A)
    error('Must enter 2 dimensional matrix for A.')
end
if nargin ~= 1
    error('Input 1 matrix only.')
end

if size(A,1) ~= size(A,2)
    error('Matrix must be square.')
end
%save size of matrix:
[m, n] = size(A);
%initialize values:
U=A;
L=eye(n);
P=eye(n);
    for iter=1:m-1
        piv=max(abs(U(iter:m,iter))); 
        %find location of max values
        for j=iter:m
            if(abs(U(j,iter))==piv)
                max_loc=j;
            end
        end
        U([iter,max_loc],iter:m)=U([max_loc,iter],iter:m); %Pivoting rows by max_loc and iter
        L([iter,max_loc],1:iter-1)=L([max_loc,iter],1:iter-1); %Pivoting rows by max_loc and iter
        P([iter,max_loc],:)=P([max_loc,iter],:); %Pivoting rows by max_loc and iter
        for j=iter+1:m
            L(j,iter)=U(j,iter)/U(iter,iter);
            U(j,iter:m)=U(j,iter:m)-L(j,iter)*U(iter,iter:m);
        end
    end
end