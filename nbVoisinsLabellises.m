function [ lab, nb ] = nbVoisinsLabellises( label,x,y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
nb=0;
lab=1;
voisins=label(x-1:x+1,y-1:y+1);
voisins=unique(voisins);
for idx = 1:numel(voisins)
    v = voisins(idx);
    if v>1
        nb=nb+1;
        if lab<v
            lab=v;
        end
    end
end
end

