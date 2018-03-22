%1. algorithme de l'érosion ultime
clear all;
S= [ 0 1 0 ;
     1 1 1 ;
     0 1 0 ];
 img=imread('BE06I01.bmp');
 imgbin=zeros(296,534);
 for i=1:296
     for j=1:534
        if img(i,j,1)<127
            imgbin(i,j)=0;
        else
            imgbin(i,j)=1;
        end
     end
 end
 
imgErod = double(bwulterode(imgbin,'euclidean',8));
imgEnd=bwmorph(imgErod,'endpoints');
%   imgOuvert=bwmorph(imgbin, 'open');
%   imgSkel=bwmorph(imgOuvert,'thin');
%   imgbranch=bwmorph(imgSkel,'branchpoints');
  figure, imshow(imgEnd);
  figure, imshow(imgErod);
  imgErodCl=[];
  imgEndCl=[];
  for x=1:296
      for y=1:534
          if imgErod(x,y)==1
              imgErodCl=[imgErodCl;x y];
          end
          if imgEnd(x,y)==1
              imgEndCl=[imgEndCl;x y];
          end
      end
  end
  figure
  hold on
  plot(imgErodCl(:,1),imgErodCl(:,2),'b*')
  plot(imgEndCl(:,1),imgEndCl(:,2),'r*')
  hold off
%  imgF=imgbin-imgOuvert;
 %BW3 = bwmorph(BW2,'branchpoints');
 imgtmp=zeros(296,534);
%  while(~isEqual(imgtmp,imgErod))
%     imgtmp2=imerode(imgbin,S);
%     'yolo'
%     if ~isEqual(imgtmp2,imgErod)
%         imgtmp=imgtmp2
%     end
%  end
 for i=2:296-1
     for j=2:534-1
         %regarde tous voisins horizon + vertic seuls
         coord=[];
         if imgbin(i,j)==1
            voisin=[];
            k=1;
            if(imgbin(i-1,j)==1)
                voisin(k,1) = i-1;
                voisin(k,2) = j;
                k=k+1;
            end
            if(imgbin(i+1,j)==1)
                voisin(k,1) = i+1;
                voisin(k,2) = j;
                k=k+1;
            end
            if(imgbin(i,j-1)==1)
                voisin(k,1) = i;
                voisin(k,2) = j-1;
                k=k+1;
            end
            if(imgbin(i,j+1)==1)
                voisin(k,1) = i;
                voisin(k,2) = j+1;
                k=k+1;
            end
            X= 0;
            Y= 0;
            for c=1:length(voisin)-1
                X = X + (voisin(c,1) - X);
                Y = Y + (voisin(c,1) - Y);
            end
            if (abs(X) + abs(Y) ==4)
                imgbin(i,j)=0;
            elseif(abs(X) + abs(Y) <=2)
                imgbin(i,j)=imgbin(i,j);
            else
                imgbin(i,j)=0;
            end 
         end
     end
 end
 
 %si les voisins sont blancs on les traite

    %X=(Xvoisin1-Xcourant)+...+(XvoisinN-Xcourant)

    %idem pour Y
    %abs(X)+abs(Y)
    %si cette somme = 4 le point courant =0
    %<=2 pas change
    %=3 cas ??
 %figure, imshow(imgbin);