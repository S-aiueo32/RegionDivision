%“Ê•ï‚É‚æ‚é”íÊ‘Ì‚Ì‘OŒãŠÖŒW„’è MainƒvƒƒOƒ‰ƒ€

clear; close all;

ORG = imread('img.jpg');
SEG = segImg(ORG,3);
% tmp = SEG{1};
% imshow(tmp);
flag = isBG(SEG);