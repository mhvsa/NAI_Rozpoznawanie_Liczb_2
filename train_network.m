function [trained_network, E_history] = train_network(network, training_set, max_epocs = 500,lambda=1,alpha=1, E_history = [])
  trained_network = network;
  training_set = training_set(randperm(numel(training_set)));
  for i = 1:max_epocs
    training_set = training_set(randperm(numel(training_set)));
    before_network = trained_network;
    for j = 1:size(training_set)
      trainig_vector = training_set(j);
      err = backward_error_propagation(trained_network,trainig_vector,lambda);
      trained_network = weight_correction(trained_network,err,trainig_vector.input,alpha);
    end
    E = calculate_error(trained_network,training_set,lambda);
    E_history = [E_history E];
    network = trained_network;
    if(E == 0)
      break
    end

  end
end