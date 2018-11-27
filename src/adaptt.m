function [ y ] = adaptt(x)
if std2(x) <1
    y = ones(sixe(x,1), size(x,2));
else
    y = im2bw(x,graythresh(x));
    
end