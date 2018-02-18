clear all;
LUT8init=[0,0,0;0,0,128;0,128,0;0,128,128;128,0,0;128,0,128;128,128,0;128,128,128];
image1 = double(imread('TP01I01.bmp'));
image2 = double(imread('TP01I02.jpg'));
image3 = double(imread('TP01I03.jpg'));
image1Q = [];
image2Q = [];
image3Q = [];
%image 1
LUT=LutSubSamp(32);
tic
tmp2=0;
for x = 1:256
    for y= 1:256
        tmp=inf;
        for i = 1:32
            dm=abs(image1(x,y,1)-LUT(i,1))+abs(image1(x,y,2)-LUT(i,2))+abs(image1(x,y,3)-LUT(i,3));
            if dm<tmp
                tmp=dm;
                tmp2=i;
            end
            image1(x,y,1)=LUT(tmp2,1);
            image1(x,y,2)=LUT(tmp2,2);
            image1(x,y,3)=LUT(tmp2,3);
        end
    end
end
%histogramme
imhist(image1,32)
fprintf("temps image 1: ")
toc
%err = mse(image1Q,image1);
%err = sum(err)/(3*256*256);
%fprintf('\n The mean-squared error of image 1 is %0.4f\n', err);
image(uint8(image1));

%image 2
tic

fprintf("temps image 2: ")
toc
%image(uint8(image2Q));
%colormap(gray(256));
%err = mse(image2Q,image2);
%err = sum(err)/(3*256*256);
%fprintf('\n The mean-squared error of image 2 is %0.4f\n', err);

%image 3
tic

fprintf("temps image 3: ")
toc
%image(uint8(image3Q));
% err = mse(image3Q,image3);
% err = sum(err)/(3*256*256);
% fprintf('\n The mean-squared error of image 3 is %0.4f\n', err);