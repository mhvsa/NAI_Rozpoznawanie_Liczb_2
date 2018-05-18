function err = backward_error_propagation(network,training_vector,lambda = 1)
  
  input = training_vector.input;
  labels = training_vector.labels;
  
  hidden_layer_net = calculate_net(network.hidden_layer, input);
  v = [arrayfun(@(x) calculate_sigmoidal(x,lambda), hidden_layer_net);1]; % create good input to a second layer
  output_layer_net = calculate_net(network.output_layer,v);
  y = calculate_out(network,input);
  
  der = arrayfun(@(x) calculate_sigmoidal_derivative(x,lambda), output_layer_net);
  err.output_layer = der .* (labels - y);
  
  d = err.output_layer;
  err.hidden_layer = [];
  
  der = arrayfun(@(x) calculate_sigmoidal_derivative(x,lambda), hidden_layer_net);
  
  number_of_neurons = size(network.hidden_layer);
  
  % find easier, more elegant solution - propbably is possible to vectorize it
  for i = 1:number_of_neurons
    err.hidden_layer = [err.hidden_layer;der(i) .* sum(network.output_layer(:,i) .* d)];
  end
   
end