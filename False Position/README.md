This algorith uses False Position method to find root of func.
Inputs:
   func = the function being evaluated
   xl = lower guess
   xu = upper guess
   es = desired relative error (default = 0.0001%)
   maxit = the maximum number of iterations to use (default = 200)
   varargin = any additional parameters used by the function
Outputs:
   root = the estimated root location
   fx = the function evaluated at the root location
   ea = the approximate relative error (%)
   iter = how many iterations were performed
Limitations: Used to calculate single unknown
             Comparatively slow
