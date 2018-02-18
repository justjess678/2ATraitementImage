%Masque flou
clear all;
%I1= double(imread('TP03I02.jpg'));
I1=double(imread('TP03I04.jpg'));
I1R=I1(:,:,1);
I1G=I1(:,:,2);
I1B=I1(:,:,3);
coef=50;
%floutage
filtrePB=ones(3)*(1/9);
I2R=zeros(400,599);
I2G=zeros(400,599);
I2B=zeros(400,599);
I3R=zeros(400,599);
I3G=zeros(400,599);
I3B=zeros(400,599);
I4R=zeros(400,599);
I4G=zeros(400,599);
I4B=zeros(400,599);
I5R=zeros(400,599);
I5G=zeros(400,599);
I5B=zeros(400,599);
I2R=conv2(I1R,filtrePB,'same');
I2G=conv2(I1G,filtrePB,'same');
I2B=conv2(I1B,filtrePB,'same');
for i=1:400
    for j=1:599
        I3R(i,j)=I1R(i,j)-I2R(i,j);
        I3G(i,j)=I1G(i,j)-I2G(i,j);
        I3B(i,j)=I1B(i,j)-I2B(i,j);
    end
end
I4R=I3R*coef;
I4G=I3G*coef;
I4B=I3B*coef;
%verifier pixels entre 0 et 255
for i=1:400
    for j=1:599
        I5R(i,j)=I1R(i,j)+I4R(i,j);
        I5G(i,j)=I1G(i,j)+I4G(i,j);
        I5B(i,j)=I1B(i,j)+I4B(i,j);
    end
end
for i=1:400
    for j=1:599
        if I5R(i,j)<0
            I5R(i,j)=0;
        end
        if I5R(i,j)>255
            I5R(i,j)=255;
        end
        if I5G(i,j)<0
            I5G(i,j)=0;
        end
        if I5G(i,j)>255
            I5G(i,j)=255;
        end
        if I5B(i,j)<0
            I5B(i,j)=0;
        end
        if I5B(i,j)>255
            I5B(i,j)=255;
        end
    end
end
I5(:,:,1)=I5R;
I5(:,:,2)=I5G;
I5(:,:,3)=I5B;
image(uint8(I5));
