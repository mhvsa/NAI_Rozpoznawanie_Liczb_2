function derivative = calculate_sigmoidal_derivative(x, lambda = 1)
  derivative = lambda * calculate_sigmoidal(x,lambda) * (1 - calculate_sigmoidal(x,lambda));
end;