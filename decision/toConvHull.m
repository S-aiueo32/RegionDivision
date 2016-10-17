% オブジェクトの凸包を2値画像として返す関数

function y = toConvHull(x)
    %x = rgb2gray(x);
    x = x > Threshold(x);
    %imshow(x); axis image; pause;

    CV = regionprops(x,'ConvexHull');
    anchor = [uint16(max(CV.ConvexHull(:,2))),...
        uint16(max(CV.ConvexHull(:,1)))];

    CI = regionprops(x,'ConvexImage');
    CI = getfield(CI,'ConvexImage');

    %imshow(CI); pause;
    [m,n] = size(CI);
    for ii = 1:m
        for jj = 1:n
            x(anchor(1)-ii, anchor(2)-jj) ...
                = CI(m-ii+1,n-jj+1);
        end
    end

    y = x;
end