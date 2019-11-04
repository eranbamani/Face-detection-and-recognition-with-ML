% function Learning algorithm, train_test_split
% Eran Bamani
% 5.2.19
% exe 5 
% =========================================================================
function [w,min_c] = machine_algorithm(data)
% data
feature = data(:,1);         
class = data(:,2);  
assert(size(feature,1)==size(class,1))
train = 0.7;
[n,m] = size(feature);
rand_index = randperm(n);
n_train = ceil(n*train);
%--------------------------------------------------------------------------
% train_test_split
x_train = zeros(n_train,m);  
x_test = zeros(n-n_train,m); 
y_train = zeros(n_train,1);   
y_test = zeros(n-n_train,1);
% randomize
for i=1:n_train
    x_train(i,:) = feature(rand_index(i),:);
    y_train(i) = class(rand_index(i));
end

for i=n_train+1:n
    x_test(i-n_train,:) = feature(rand_index(i),:);
    y_test(i-n_train) = class(rand_index(i));
end


assert(size(x_train,1)+size(x_test,1)==size(feature,1));  
assert(size(y_train,1)+size(y_test,1)==size(feature,1));
%--------------------------------------------------------------------------
%find Weights vector
[w,min_c] = w_vector(x_train,x_test,y_train,y_test);

end