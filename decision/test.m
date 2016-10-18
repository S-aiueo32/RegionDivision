% 凸包による前後判定プログラム

clear; close all;

SEG = cell(1,3);
CH = cell(1,3);
BW = cell(1,3);
%OL = cell(1,nchoosek(2,2));
SEG{1} = rgb2gray(imread('segmented_images_01.jpg'));
SEG{2} = rgb2gray(imread('segmented_images_03.jpg'));
SEG{3} = rgb2gray(imread('segmented_images_02.jpg'));
BGFlag = [false,false,false];

%背景かどうかを判定＆画像の2値化
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
    BW{ii} = SEG{ii} > Threshold(SEG{ii});  %2値化
end

%各オブジェクトの凸包を2値画像として生成(背景は除外)
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

% 各オブジェクトの重なり(背景は除外)
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
