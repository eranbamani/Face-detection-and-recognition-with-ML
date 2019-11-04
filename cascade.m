% function Cascade
% Eran Bamani
% 3.2.19
% exe 5 
% =========================================================================
function [error] = cascade(total,label,counter,integralImage,features)

rate = 0.8;
error = 0;
cascade = 0;
ep = randi(total);
    
for final_test = 1:ep
      i = randi(total);
      for s = 1:counter
          Haar_type = (mod(s,length(label)));
          ii = integralImage(:,:,i);
%           [feature] = Haar(ii,features(1,s),features(2,s),features(3,s),features(4,s),Haar_type);
          [feature] = Haar_Classifier(ii,features(1,s),features(2,s),features(3,s),features(4,s),Haar_type);
          if sign(feature*features(5,s))>0
             cascade = cascade+1;
          end
      end
      if cascade >= counter*rate
         error = error+1;
      else
         error = error-1;
      end
end

end