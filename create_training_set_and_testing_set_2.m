function [training_set, testing_set] = create_training_set_and_testing_set ()
 
 % 0 0 0 | 0
 % 0 0 1 | 1
 % 0 1 0 | 2
 % 0 1 1 | 3
 % 1 0 0 | 4
 % 1 0 1 | 5
 
 training_set = [];
 testing_set = [];
 
 load './data/zeros_input.dat';
 load './data/ones_input.dat';
 load './data/twos_input.dat';
 load './data/threes_input.dat';
 load './data/fours_input.dat';
 load './data/fives_input.dat';
 
 % zeros
 label = [0;0;1];
 for i = 1: size(zeros_input)
   input = zeros_input(i,:)';
   training_vector.input = [input;1];
   training_vector.labels = label;
   if mod(i,2) == 1
    training_set = [training_set training_vector];
   else
    testing_set = [testing_set training_vector];
   end
 end
 
 % ones
 label = [0;1;0];
 for i = 1: size(ones_input)
   input = ones_input(i,:)';
   training_vector.input = [input;1];
   training_vector.labels = label;
   if mod(i,2) == 0
    training_set = [training_set training_vector];
   else
    testing_set = [testing_set training_vector];
   end
 end
 
 %twos
 label = [1;0;0]
 for i = 1: size(twos_input)
   input = twos_input(i,:)';
   training_vector.input = [input;1];
   training_vector.labels = label;
   if mod(i,2) == 0
    training_set = [training_set training_vector];
   else
    testing_set = [testing_set training_vector];
   end
 end

end