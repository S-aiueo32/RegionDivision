% 画像のセグメンテーションを行う関数

function y = segImg(img,obj)
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
    
    y = segmented_images;
end