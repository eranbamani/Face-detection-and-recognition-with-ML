% function Stochastic Gradient Descent
% Eran Bamani
% 12.12.18
% exe 4-5 (build this fun in exe4) 
% =========================================================================
function w = SGD(x_train,y_train,min_c)
% check
assert(size(x_train,1) == size(y_train,1));
% data
alpha = 1;                      
EP = 1;                
[N,M] = size(x_train); 
w = zeros(1,M);                
%--------------------------------------------------------------------------
for t = 1:(EP*N)       
    i = randi(N);               
    hinge_loss = 1 - y_train(i)*(w*x_train(i)); 
    if hinge_loss<=0            
       imp = w/N;
    else
       imp = w/N-min_c*y_train(i)*x_train(i);    
    end
    w = w - (alpha/t)*imp;  
end

end