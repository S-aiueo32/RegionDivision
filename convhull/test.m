%�ʕ�̐����̃e�X�g
%����512x512�̉摜�ɂ̂ݐ���������D

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

%�r���o�߂Ŏg�p
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
%�r���o�߂Ŏg�p
%saveas(gcf,'covhull.jpg');

ax = gca;
ax.OuterPosition = [0 0 1 1];
ax.Position = [0 0 1 1];

fig.Position = [649 579 245.8 245.8];
%j.OuterPosition = [0 0 100 100];

fill(n(k),m(k),'w');
saveas(gcf,'nuritsubushi.jpg');