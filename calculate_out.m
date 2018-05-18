function [y, y1] = calculate_out(network, input, lambda = 1)
  y1 = arrayfun(@(x) calculate_sigmoidal(x,lambda), calculate_net(network.hidden_layer, input));
  y1 = [y1;1];
  y = arrayfun(@(x) calculate_sigmoidal(x,lambda), calculate_net(network.output_layer, y1));
end