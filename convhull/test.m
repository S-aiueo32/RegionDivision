%ì ïÔÇÃê∂ê¨ÇÃÉeÉXÉg

clear; close all;

img = imread('segmented_images_03.jpg');
grayImg = rgb2gray(img);
edgeImg = edge(grayImg,'Sobel');
imshow(img); axis image; hold on;

[x,y] = size(edgeImg);
m = [];
n = [];
for ii = 1:x
    for jj = 1:y
        if edgeImg(ii,jj)==1
            m = [m,ii];
            n = [n,jj];
        end
    end
end

k = convhull(m,n);
plot(n(k),m(k),'r-','LineWidth',2);
saveas(gcf,'covhull.jpg');
