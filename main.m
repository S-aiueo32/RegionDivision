%�ʕ�ɂ���ʑ̂̑O��֌W���� Main�v���O����

clear; close all;

ORG = imread('img.jpg');
SEG = segImg(ORG,3);
% tmp = SEG{1};
% imshow(tmp);
flag = isBG(SEG);