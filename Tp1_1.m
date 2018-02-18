clear all;
LUT=LutSubSamp(32);
image1 = double(imread('TP01I01.bmp'));
image2 = double(imread('TP01I02.jpg'));
image3 = double(imread('TP01I03.jpg'));
i=1;
a=[0;64;128;192];
LUT8init=[];
for j=1:4
   LUT8init(i,1)=a(j);
   for e=1:4
       LUT8init(i,1)=a(j);
       LUT8init(i,2)=a(e);
       for u=1:4
           LUT8init(i,1)=a(j);
           LUT8init(i,2)=a(e);
           LUT8init(i,3)=a(u);
           i=i+1;
       end
       i=i+1;
   end
   i=i+1;
end
LUT8init = unique(LUT8init,'rows');
%image 1
tic
tmp2=0;
for x = 1:256
    for y= 1:256
        tmp=inf;
        for i = 1:64
            dm=abs(image1(x,y,1)-LUT8init(i,1))+abs(image1(x,y,2)-LUT8init(i,2))+abs(image1(x,y,3)-LUT8init(i,3));
            if dm<tmp
                tmp=dm;
                tmp2=i;
            end
            image1Q(x,y,1)=LUT8init(tmp2,1);
            image1Q(x,y,2)=LUT8init(tmp2,2);
            image1Q(x,y,3)=LUT8init(tmp2,3);
            image1nb(x,y)=tmp2;
        end
    end
end
B=tabulate(image1nb)
fprintf("temps image 1: ")
toc
%image 2
tic;
tmp2=0;
for x = 1:677
    for y= 1:1023
        tmp=inf;
        for i = 1:32
            dm=abs(image2(x,y)-LUT(i,1))+abs(image2(x,y)-LUT(i,2))+abs(image2(x,y)-LUT(i,3));
            if dm<tmp
                tmp=dm;
                tmp2=i;
            end
            image2Q(x,y)=LUT(tmp2,1);
            image2Q(x,y)=LUT(tmp2,2);
            image2Q(x,y)=LUT(tmp2,3);
        end
    end
end
fprintf("temps image 2: ")
toc
%image 3
tic
tmp2=0;
for x = 1:677
    for y= 1:1023
        tmp=inf;
        for i = 1:32
            dm=abs(image3(x,y,1)-LUT(i,1))+abs(image3(x,y,2)-LUT(i,2))+abs(image3(x,y,3)-LUT(i,3));
            if dm<tmp
                tmp=dm;
                tmp2=i;
            end
            image3Q(x,y,1)=LUT(tmp2,1);
            image3Q(x,y,2)=LUT(tmp2,2);
            image3Q(x,y,3)=LUT(tmp2,3);
        end
    end
end
fprintf("temps image 3: ")
toc
err = mse(image1Q,image1);
err = sum(err)/(3*256*256);
fprintf('\n The mean-squared error of image 1 is %0.4f\n', err);
%image(uint8(image1Q));
%imhist(image1Q,32)
%image(uint8(image2Q));
%colormap(gray(256));
err = mse(image2Q,image2);
err = sum(err)/(3*256*256);
fprintf('\n The mean-squared error of image 2 is %0.4f\n', err);
%image(uint8(image3Q));
err = mse(image3Q,image3);
err = sum(err)/(3*256*256);
fprintf('\n The mean-squared error of image 3 is %0.4f\n', err);