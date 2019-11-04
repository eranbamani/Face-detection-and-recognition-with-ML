% function Haar Classifier
% Eran Bamani
% 3.2.19
% exe 5 
% =========================================================================
function [feature] = Haar_Classifier(ii,x,y,new_width,new_length,Haar_type)

switch Haar_type
    case 0  %Haar type 1
        [sum1] = integralImage_sum(ii,x,y,floor(new_width/2),new_length);
        [sum2] = integralImage_sum(ii,x+floor(new_width/2),y,floor(new_width/2),new_length);
        feature = (sum1-sum2);
    
    case 1  %Haar type 2
        [sum1] = integralImage_sum(ii,x,y,new_width,floor(new_length/2));
        [sum2] = integralImage_sum(ii,x,y+floor(new_length/2),new_width,floor(new_length/2));
        feature = (sum1-sum2);
    
    case 2  %Haar type 3
        [sum1] = integralImage_sum(ii,x,y,new_width,new_length);
        [sum2] = integralImage_sum(ii,x+ceil(new_width/2),y,new_width,new_length);
        [sum3] = integralImage_sum(ii,x+ceil(new_width/2),y,floor(new_width/2),new_length);
        feature = (sum1+sum2-3*sum3);
    
    case 3  %Haar type 4
        [sum1] = integralImage_sum(ii,x,y,new_length,new_width);
        [sum2] = integralImage_sum(ii,x,y+ceil(new_length/2),new_width,new_length);
        [sum3] = integralImage_sum(ii,x,y+ceil(new_length/2),new_width,floor(new_length/2));
        feature = (sum1+sum2-3*sum3);
    otherwise
    return;
end

end