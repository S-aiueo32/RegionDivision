%“Ê•ï‚É‚æ‚é”íÊ‘Ì‚Ì‘OŒãŠÖŒW„’è MainƒvƒƒOƒ‰ƒ€

clear; close all;

name = 'img02.jpg';
ORG = imread(name);

imshow(ORG); pause;

SEG = segImg(ORG,4);

imshow(SEG{1}); pause;
imshow(SEG{2}); pause;
imshow(SEG{3}); pause;
imshow(SEG{4}); pause;

SEG = contextEst(SEG);

imshow(SEG{1}); pause;
imshow(SEG{2}); pause;
imshow(SEG{3}); pause;
imshow(SEG{4}); pause;

% [m,n] = size(SEG);
% mkdir(['images/',name]);
% for ii = 1:n
%     imwrite(SEG{ii},['images/',name,'/',num2str(ii),'.jpg']);
% end