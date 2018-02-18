%Debruitage
img = imread('TP03I01.jpg');
imgSP=img;
N=5000;
err=zeros(2,10000);
for N=5000:5500
%pixels à 255
for i=1:N
    imgSP(randi(600),randi(400))=255;
end
%pixels à 0
for i=1:N
    imgSP(randi(600),randi(400))=0;
end
imgFL=imgSP;
%imshow(imgSP);
for i=1:596
    for j=1:396
        tmp=sort(reshape(imgFL(i:i+4,j:j+4),[],1));
        med=median(tmp);
        imgFL(i+2,j+2)=med;
    end
end
%imshow(imgFL);
diff=zeros(600,400);
for i=1:600
    for j=1:400
        diff(i,j)=img(i,j)-imgSP(i,j);
    end
end
err(1,N)=1/(600*400)*sum(sum(diff));
for i=1:600
    for j=1:400
        diff(i,j)=img(i,j)-imgFL(i,j);
    end
end
err(2,N)=1/(600*400)*sum(sum(diff));
end
plot(N,err)
