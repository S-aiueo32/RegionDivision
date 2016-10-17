%regionpropsのconvImageプロパティのテスト

clear; close all;

BW = rgb2gray(imread('tri.jpg'));
BW = BW > Threshold(BW);
imshow(BW); axis image; pause;

CV = regionprops(BW,'ConvexHull');
anchor = [uint16(max(CV.ConvexHull(:,2))),...
    uint16(max(CV.ConvexHull(:,1)))];

CI = regionprops(BW,'ConvexImage');
CI = getfield(CI,'ConvexImage');

imshow(CI); pause;
[m,n] = size(CI);
for ii = 1:m
    for jj = 1:n
        BW(anchor(1)-ii, anchor(2)-jj) ...
            = CI(m-ii+1,n-jj+1);
    end
end

imshow(BW)
hold on

hold off
