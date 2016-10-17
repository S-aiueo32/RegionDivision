%regionpropsのconvImageプロパティのテスト

clear; close all;

BW = rgb2gray(imread('tri.jpg'));
BW = BW > Threshold(BW);
imshow(BW); axis image; pause;

CV = regionprops(BW,'ConvexHull');
anchor = [uint16(min(CV.ConvexHull(:,2))),...
    uint16(min(CV.ConvexHull(:,1)))];

CI = regionprops(BW,'ConvexImage');
CI = getfield(CI,'ConvexImage');

imshow(CI); pause;
[m,n] = size(CI);
for ii = 1:m
    for jj = 1:n
        BW(anchor(1)+ii-1, anchor(2)+jj-1) ...
            = CI(ii,jj);
    end
end

imshow(BW)
hold on

hold off
