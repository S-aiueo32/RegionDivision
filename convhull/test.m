%凸包の生成のテスト
%現状512x512の画像にのみ正しく動作．

clear; close all;

img = imread('segmented_images_01.jpg');
grayImg = rgb2gray(img);
edgeImg = edge(grayImg,'Sobel');
fig = figure;
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

%途中経過で使用
%plot(n(k),m(k),'r-','LineWidth',2); 


% set(gca, 'LooseInset', get(gca, 'TightInset'));
% set(j,'Units','Inches');
% pos = get(j,'Position');
% pos(3) = x;
% pos(4) = y;
% set(j,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
% 
% cdata = print(j,'-RGBImage');

%set(gcf,'Color','none');
%set(gca,'Color','none');
%set(gcf,'InvertHardcopy','off');
%途中経過で使用
%saveas(gcf,'covhull.jpg');

ax = gca;
ax.OuterPosition = [0 0 1 1];
ax.Position = [0 0 1 1];

fig.Position = [649 579 245.8 245.8];
%j.OuterPosition = [0 0 100 100];

fill(n(k),m(k),'w');
saveas(gcf,'nuritsubushi.jpg');