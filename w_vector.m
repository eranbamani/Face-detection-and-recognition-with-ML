% function weights vector
% Eran Bamani
% 5.2.19
% exe 5 
% =========================================================================
function [w,min_c] = w_vector(x_train,x_test,y_train,y_test)
% data
c_vec = 2.^(-5:2:15);                           
EP = 5;                        
err_vec = zeros(1,length(c_vec));
% 
[n,m] = size(x_train);
[N,M] = size(x_test);
% 
train_norm = zeros(n,m);
test_norm = zeros(N,M);
% 
max_train = zeros(1,m);
max_test = zeros(1,M);
min_train = zeros(1,m);
min_test = zeros(1,M);
%-------------------------------------------------------------------------- 
% normalize
for i=1:m
    max_train(i) = max(x_train(:,i));
    min_train(i) = min(x_train(:,i));
    train_norm(:,i) = (x_train(:,i)-min_train(i))/ (max_train(i)-min_train(i));
end

for i=1:M
    max_test(i) = max(x_test(:,i));
    min_test(i) = min(x_test(:,i));
    test_norm(:,i) = (x_test(:,i)-min_test(i))/ (max_test(i)-min_test(i));
end
%--------------------------------------------------------------------------
% SGD
for i = 1:length(c_vec)  
    temp = c_vec(i);   
    err_avg = 0;             
    for j = 1:EP      
        w = SGD(train_norm,y_train,temp);
        y_temp = w' * test_norm';
        y_sign = y_temp * y_test;
        err_num = length(y_sign(y_sign<0));  
        err_avg = err_avg + err_num;         
    end
    err_vec(i) = err_avg/EP;     
end
min_c = c_vec(err_vec==min(err_vec));  
w = SGD(x_train,y_train,min_c);  
w = mean(w);
end