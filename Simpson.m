function [I] = Simpson(x, y)
% Simpson.m
% Created on 11-10-19
% Last modified on 11-14-19
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
    error('Vector dimensions must be equal')
end
xl = length(x);
H = x(2) - x(1); %assigning step size to H
if xl == 2 %verifying whether or not trap rule needed
    warning('Trapizoidal rule will be used')
    I = H*(y(2))/xl; %implements trap rule
else
    for i=2: xl-1
        var_s = x(i+1)-x(i); %determining spacing
       if var_s ~= H %ensuring even spacing and equal to step size 
           error('Variable spacing must be equal')
       end
    end
    tlast=0; %defaulting "tlast" to "false" before assesing if last interval requires trap rule
    if rem(xl,2)==0 %determining if trap rule will be used on last interval
        warning('Trapizoidal rule will be used')
        tlast=1; %if trap rule needed "tlast" is assigned "true" value
        int=xl-1;
    else
        int = xl;
    end
    I = 0; %intializing I for for loop
    for j=1:2:int-2
        I=I+y(j)+4*y(j+1)+y(j+2);
    end
    I=H*I/3;
    if tlast==1 %confirms if trap rule needed
        I=I+(y(xl)-y(xl-1))/H; %implements trap rule final interval
    end
end
