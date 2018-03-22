%TP4 algorithme de la bulle
%1 Gradient
clear all;
gradient=double(zeros(50));
k=1;
for i=10:16
    k=k*2;
    gradient(i:50-i+1,i:50-i+1)=k;
end
for i=17:23
    k=k/2;
    gradient(i:50-i+1,i:50-i+1)=k;
end
%imshow(gradient);
nbpoints=0;
contour=[];
imgbin=ones(50,50);
imgbin(25,25)=0;
imgbin(25,26)=0;
imgbin(26,25)=0;
imgbin(26,26)=0;

[contour,nbpoints]=tortue(imgbin);
%moyenne(gradient(points du contour)))
bulle=zeros(50,50);
grad=energie(contour,gradient,nbpoints);
for i=1:nbpoints
   bulle(contour(i,1),contour(i,2))=grad ;
end

%Bulle
res1=zeros(50);
res2=zeros(50);
resFin=zeros(50);
v=[];
E=0;
%inserer condition prendre energie <=
while(energie(contour,gradient,nbpoints)<E)
    E=energie(contour,gradient,nbpoints)
    for i=2:49
        for j=2:49
            v=[bulle(i-1,j-1) bulle(i-1,j) bulle(i-1,j+1) bulle(i,j+1) bulle(i+1,j+1) bulle(i+1,j) bulle(i+1,j-1) bulle(i,j-1) bulle(i-1,j-1)];
            res1(i,j)=sum(xor(v(1:8),v(2:9)));
            res2(i,j)=sum(v(1:8)==0);
        end
    end
    %inversement des 1 et 0 pour la fct tortue
    for p=1:50
        for q=1:50
            if res1(p,q)>0
                resFin(p,q)=0;
            else
                resFin(p,q)=1;
            end
        end
    end
    [contour,nbpoints]=tortue(resFin);
end
%%

%code pour faire des gradients
img=imread('TP04I01.jpg');
grad1=conv2(img, [-1 -1 -1;0 0 0;1 1 1 ],'same');
grad2=conv2(img, [-1 0 1;-1 0 1;-1 0 1],'same');
gradient=grad1+grad2;

[contour,nbpoints]=tortue(img);
%moyenne(gradient(points du contour)))
bulle=zeros(347,443);
grad=energie(contour,gradient,nbpoints);
for i=1:nbpoints
   bulle(contour(i,1),contour(i,2))=grad ;
end

%Bulle
res1=zeros(347,443);
res2=zeros(347,443);
resFin=zeros(347,443);
v=[];
E=0;
%inserer condition prendre energie <=
while(energie(contour,gradient,nbpoints)<E)
    E=energie(contour,gradient,nbpoints)
    for i=2:347-1
        for j=2:443-1
            v=[bulle(i-1,j-1) bulle(i-1,j) bulle(i-1,j+1) bulle(i,j+1) bulle(i+1,j+1) bulle(i+1,j) bulle(i+1,j-1) bulle(i,j-1) bulle(i-1,j-1)];
            res1(i,j)=sum(xor(v(1:8),v(2:9)));
            res2(i,j)=sum(v(1:8)==0);
        end
    end
    %inversement des 1 et 0 pour la fct tortue
    for p=1:347
        for q=1:443
            if res1(p,q)>0
                resFin(p,q)=0;
            else
                resFin(p,q)=1;
            end
        end
    end
    [contour,nbpoints]=tortue(resFin);
end