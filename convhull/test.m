%ì ïÔÇÃê∂ê¨ÇÃÉeÉXÉg

clear; close all;

I = rgb2gray(imread('segmented_images_03.jpg'));
BI = edge(I,'Sobel');
imshow(BI); hold on;

[x,y] = size(BI);
m = [];
n = [];
for ii = 1:x
    for jj = 1:y
        if BI(ii,jj)==1
            m = [m,ii];
            n = [n,jj];
        end
    end
end

k = convhull(m,n);
plot(n(k),m(k),'r-');
axis image;