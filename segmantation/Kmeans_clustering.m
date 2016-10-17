%K-Means Clustering

clear; close all;

name = 'convexhull03';
img = imread([name,'.jpg']);
obj = 3;    %îwåiçûÇ›ÇÃï™äÑêî
%imshow(img);

cform = makecform('srgb2lab');
lab_img = applycform(img,cform);

ab = double(lab_img(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = obj;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);

pixel_labels = reshape(cluster_idx,nrows,ncols);

segmented_images = cell(1,obj);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = img;
    %color(rgb_label ~= k) = 255;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

mkdir(name);
for k = 1:nColors
    tmp = uint8(segmented_images{k});
    imwrite(tmp,[name,'/segmented_images_0',num2str(k),'.jpg']);
end

return;