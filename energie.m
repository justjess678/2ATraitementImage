function [ grad ] = energie( contour,gradient,nbpoints)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
grad=0;
tmp=[];
for i=1:nbpoints
    x=contour(i,1);
    y=contour(i,2);
    grad=grad+gradient(x,y);
end
grad=-1*mean(grad)/nbpoints;
end

