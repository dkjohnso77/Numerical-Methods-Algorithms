function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% falsePosition.m
% Created on 10-4-19
% Created by Derrick Johnson
% Last modified on 10-6-19
% Uses False Position method to find root of func
% Inputs:
%   func = the function being evaluated
%   xl = lower guess
%   xu = upper guess
%   es = desired relative error (default = 0.0001%)
%   maxit = the maximum number of iterations to use (default = 200)
%   varargin = any additional parameters used by the function
% Outputs:
%   root = the estimated root location
%   fx = the function evaluated at the root location
%   ea = the approximate relative error (%)
%   iter = how many iterations were performed

if nargin<3
    error('At least 3 input arguments are required.') % Throwing error if user has too few inputs
elseif nargin>5
    error('No more than 5 inputs accepted.') % Throwing error if user has too many inputs
end
if func(xl,varargin{:})*func(xu,varargin{:}) > 0
error('No sign change on initial guesses') % Throwing error if initial guesses are on same side of root
end
if nargin<4 || isempty(es)
    es = 0.0001; % Assigning default rel. error
end
if nargin<5 || isempty(maxit)
    maxit = 200; % Assigning default maximum number of iterations
end
ea = 1; %initial approx rel. error = 100%
it = 1; %initializing the iteration counter
while es < ea
    root = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))); % guess at root using false position equation 
    xr_g(it+1) = root; % storing the current guess at root for error calculation
    ea = abs(((xr_g(it+1) - xr_g(it))/xr_g(it+1))*100); % approximate relative error
    fx = func(root); % Value of the function evaluated at current root guess
    if func(xl)*fx < 0
        xu = root; % new guess at upper bound
    elseif func(xu)*fx < 0
        xl = root; % new guess at lower bound
    end
    it = it+1; %adding iteration to the counter
end
iter = it - 2; %total number of iterations