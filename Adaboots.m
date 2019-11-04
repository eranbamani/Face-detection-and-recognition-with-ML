% function Adaboots
% Eran Bamani
% 3.2.19
% exe 5 
% =========================================================================
function [features,count] = Adaboots(len_face,total,label,width,len,integralImage)
% data
err = 0.7;
data  = zeros(total,2);
tests = 28;
count = 0;
%--------------------------------------------------------------------------
for y = 1:(len-floor(len/5))
    for x = 1:(width-floor(width/5))
        while count < tests 
              count = count+1;   
              Haar_type = (mod(count,length(label)));            
              new_width = randi(floor(len/5));
              new_length = randi(floor(width/5));
              
              for i = 1:len_face
                  ii = integralImage(:,:,i);
                  [feature] = Haar_Classifier(ii,x,y,new_width,new_length,Haar_type);
                  data(i,1) = feature;
                  data(i,2) = 1;
              end
              
              for i = len_face+1:total
                  ii = integralImage(:,:,i);
                  [feature] = Haar_Classifier(ii,x,y,new_width,new_length,Haar_type);
                  data(i,1) = feature;
                  data(i,2) = -1;
              end
%--------------------------------------------------------------------------          
              [w,min_c] = machine_algorithm(data);
              if min_c < 0.3*total*err
                 features(1,count) = x;
                 features(2,count) = y;
                 features(3,count) = new_width;
                 features(4,count) = new_length;
                 features(5,count) = w;
              else
                 count = count-1;
                 continue;
              end
        end
   end
end
      
end      