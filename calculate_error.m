function E = calculate_error(network, training_set, lambda = 1)
  E = 0;
  for i = 1:length(training_set)
    training_vector = training_set(i);
    d = training_vector.labels; % label
    x = training_vector.input; % input
    out = calculate_out(network, x, lambda);
    E = E + sum((d - out).^2);
  end
  E = E * 0.5;
end;
  