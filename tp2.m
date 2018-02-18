%image1 = double(imread('TP02I01.jpg'));
%image(image1);
%colormap(gray(256));
%image1 = double(imread('TP02I02.bmp'));
image1 = double(imread('TP02I03.bmp'));
image(uint8(image1));
%image(uint8(image2));
%image(uint8(image3));
%colormap(gray(256));
image(image1);
colormap(gray(256));
hist=zeros(1,255);

for i=1:256
    hist(i)=sum(image1(:) == i);
end
%bar(image1)
%%Expansion dynamique
Imin=min(min(image1));
Imax=max(max(image1));
ExDy=zeros(size(image1,1),size(image1,2));
for row=1:size(image1,1)
    for col=1:size(image1,2)
          ExDy(row,col)=(image1(row,col)-Imin)/(Imax-Imin)*255;
      end
end
figure;
histXD=zeros(1,255);

for i=1:256
    histXD(i)=sum(ExDy(:) == i);
end
bar(histXD);
%image(ExDy);
%colormap(gray(256));
%%egalisation histogramme
histEg=zeros(size(hist));
EgHi=zeros(size(image));
histEg(1,1)=hist(1,1);
s=size(image1);
for i=2:255
    histEg(:,i)=histEg(1,i-1)+hist(1,i);
    EgHi(1,i)=(histEg(1,i)/(s(1)*s(2)))*255;
end
bar(EgHi);
image(EgHi);
colormap(gray(256));