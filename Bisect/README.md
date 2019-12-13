This algorithm uses bisection method to find root of function.
Inputs:
   func = name of function
   xl, xu = lower, upper guesses
   es = desired relative error (default = 0.0001%)
   maxit = maximum allowable iterations (default = 50)
   p1,p2... = additional parameters used by func
Outputs:
   root = estimated root location
   fx = function value at root
   ea = approximate relative error (%)
   iter = number of iterations
Limits: Comparitively slow
