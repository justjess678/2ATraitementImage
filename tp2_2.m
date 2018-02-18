image1 = double(imread('TP02I01.jpg'));
a=1;
palette=uint8(((double([0:255]')./255).^(1/a)).*255);
image(image1);
transfert(palette);
Imin=min(min(image1));
Imax=max(max(image1));
ExDy=zeros(size(image1,1),size(image1,2));
pal=[];
for row=1:size(image1,1)
    for col=1:size(image1,2)
          ExDy(row,col)=(image1(row,col)-Imin)/(Imax-Imin)*255;
          if ~ismember(ExDy(row,col),pal)
              pal=[pal,ExDy(row,col)];
          end
      end
end
palette=uint8(pal.');%modifier
image(image1);
transfert(palette);
