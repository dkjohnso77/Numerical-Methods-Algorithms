% Specify the variables needed to solve this problem (ie. height of each section, diameter, radiaus, ...)
%   It is alwasy easier to work with variables (diameter_cyl = 25) than to use numbers everywhere, since a 
%   diameter indicates something specific but the number 25 could mean anything

diameter_cyl = 25;
rad_cyl = diameter_cyl/2;
cone_h = 14;
cyl_h = 19;
empty = 0;

% Specify the height of the water
h = 20;
% You can comment / uncomment lines below for testing. This will overwrite the previous line for h = 20.
% For submission, make sure all of the following lines are commented out and h = 20! (OR IT IS MARKED AS WRONG)
%h = 5;
%h = 19;
%h = 47;
%h = -1;

% Now compute the volume. Using conditional statments you will want to first check the height makes sense,
% and then solve the volume depending on what portion of the tank has been filled.
% Make sure that your volume is stored in the variable v! (OR IT WILL BE MARKED AS WRONG)
% You may find it more convenient to move v around in you code, it is only given here to indicate what variable to use.

if isnumeric(h)
    if h > (cone_h+cyl_h)
        disp('Input error: Maximum Height is 33m.')
    elseif h < empty
        disp('Input error: Minimum Height is 0m.')
    elseif h <= cyl_h
        v = pi*rad_cyl^2*h;
        fprintf('At %d meters, there are %0.2f cubic meters of water in the tower\n ',h,v)
    else
        ful_h = rad_cyl+10.5*(h-cyl_h)/cone_h;
        v=(pi*rad_cyl^2*cyl_h)+((pi*(h-cyl_h)*(rad_cyl^2+rad_cyl*ful_h+ful_h^2))/3);   
        fprintf('At %d meters, there are %0.2f cubic meters of water in the tower\n ',h,v)
    end
else
    disp('ERROR ENTER NUMBERS ONLY');
end

