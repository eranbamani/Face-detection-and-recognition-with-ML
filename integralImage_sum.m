function [sum] = integralImage_sum(ii,x,y,new_width,new_length)

A = ii(x,y);
B = ii(x+new_width,y);
C = ii(x,y+new_length);
D = ii(x+new_width,y+new_length);
sum = D+A-B-C;

end