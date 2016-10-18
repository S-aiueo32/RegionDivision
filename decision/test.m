% �ʕ�ɂ��O�㔻��v���O����

clear; close all;

SEG = cell(1,3);
CH = cell(1,3);
BW = cell(1,3);
%OL = cell(1,nchoosek(2,2));
SEG{1} = rgb2gray(imread('segmented_images_01.jpg'));
SEG{2} = rgb2gray(imread('segmented_images_03.jpg'));
SEG{3} = rgb2gray(imread('segmented_images_02.jpg'));
BGFlag = [false,false,false];

%�w�i���ǂ����𔻒聕�摜��2�l��
for ii = 1:3
    countWhite = 0;
    countBlack = 0;
    img = SEG{ii};
    [x,y] = size(img);
    for jj = 1:x
        for kk = 1:y
            if img(jj,kk) == 255
                countWhite = countWhite + 1;
            end
            if img(jj,kk) == 0
                countBlack = countBlack + 1;
            end
        end
    end
    if countWhite > countBlack
        BGFlag(ii) = true;
    end
    BW{ii} = SEG{ii} > Threshold(SEG{ii});  %2�l��
end

%�e�I�u�W�F�N�g�̓ʕ��2�l�摜�Ƃ��Đ���(�w�i�͏��O)
for ii = 1:3
    if BGFlag(ii) == false
        %SEG{ii} = SEG{ii}>Threshold(SEG{ii});
        %imshow(SEG{ii}); pause;
        %BW{ii} = SEG{ii} > Threshold(SEG{ii});
        CH{ii} = toConvHull(SEG{ii});
        %figure(ii)
        %imshow(CONV{ii}); %pause;
    end
end

% �e�I�u�W�F�N�g�̏d�Ȃ�(�w�i�͏��O)
% for ii = 1:3
%     for jj = 1:3
%         if (BGFlag(ii) == false) && (BGFlag(jj) == false)
%             OL{ii,jj} = logical(BW{ii}.*CH{jj});
%             imshow(OL{ii,jj}); pause;
%         end
%         %imshow(OL{ii,jj}); pause;
%     end
% end

%imshow(CONV{1}); pause;
%imshow(BW{3}); pause;
%imshow(BW{1}.*OL{1,3}); pause;
%imshow(BW{3}.*OL); pause;

OL = CH{1}.*CH{2};
%imshow(OL);

if BW{1}.*OL == OL
    display('BW1 is top layer.');
elseif BW{2}.*OL == OL
    display('BW3 is top layer.');
end
