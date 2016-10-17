% “Ê•ï‚É‚æ‚é‘OŒã”»’èƒvƒƒOƒ‰ƒ€

clear; close all;

SEG = cell(1,3);
CONV = cell(1,3);
BW = cell(1,3);
OL = cell(3,3);
SEG{1} = rgb2gray(imread('segmented_images_01.jpg'));
SEG{2} = rgb2gray(imread('segmented_images_02.jpg'));
SEG{3} = rgb2gray(imread('segmented_images_03.jpg'));
BGFlag = [false,false,false];

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
    BW{ii} = SEG{ii} > Threshold(SEG{ii});
end

for ii = 1:3
    if BGFlag(ii) == false
        %SEG{ii} = SEG{ii}>Threshold(SEG{ii});
        %imshow(SEG{ii}); pause;
        %BW{ii} = SEG{ii} > Threshold(SEG{ii});
        CONV{ii} = toConvHull(SEG{ii});
        %figure(ii)
        %imshow(CONV{ii}); %pause;
    end
end

for ii = 1:3
    for jj = 1:3
        if (BGFlag(ii) == false) && (BGFlag(jj) == false)
            OL{ii,jj} = logical(BW{ii}.*CONV{jj});
            %imshow(OL{ii,jj}); pause;
        end
        %imshow(OL{ii,jj}); pause;
    end
end

%imshow(BW{1}); pause;
%imshow(BW{3}); pause;
%imshow(BW{1}.*OL{1,3}); pause;
%imshow(BW{3}.*OL); pause;