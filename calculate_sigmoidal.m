function y = calculate_sigmoidal(x, lambda = 1)
  y = 1/(1 + exp(-lambda*x));
 end