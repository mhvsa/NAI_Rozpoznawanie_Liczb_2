function new_network = weight_correction(network, err, input,alpha = 1)
  
  new_network = network;
  
  out_from_hidden_layer = [arrayfun(@(x) calculate_sigmoidal(x), calculate_net(network.hidden_layer,input));1];

  x = out_from_hidden_layer';
  x = x .* alpha;

  m = err.output_layer .* x;

  new_network.output_layer = network.output_layer + m;
  
  x = input' .* alpha;
  m = err.hidden_layer .* x;

  new_network.hidden_layer = network.hidden_layer + alpha * m;
  
end