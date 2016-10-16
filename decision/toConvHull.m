function y = toConvHull(x)
    img = x;
    %grayImg = rgb2gray(img);
    %edgeImg = edge(grayImg,'Sobel');
    fig = figure;
    imshow(img); axis image; hold on;

    %[x,y] = size(edgeImg);
    [x,y] = size(img);
    m = [];
    n = [];
    for ii = 1:x
        for jj = 1:y
            if img(ii,jj)==1
                m = [m,ii];
                n = [n,jj];
            end
        end
    end

    ax = gca;
    ax.OuterPosition = [0 0 1 1];
    ax.Position = [0 0 1 1];
    fig.Position = [649 579 245.8 245.8];

    k = convhull(m,n);
    fill(n(k),m(k),'w');
    %saveas(gcf,'nuritsubushi.jpg');
    y = print(fig,'-RGBImage');
end