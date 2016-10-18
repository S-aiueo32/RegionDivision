% �ʕ�ɂ��O�㔻��v���O����

clear; close all;

SEG = cell(1,3);
[m,n] = size(SEG);
CH = cell(m,n);
BW = cell(m,n);
%OL = cell(1,nchoosek(2,2));
SEG{1} = rgb2gray(imread('segmented_images_01.jpg'));
SEG{2} = rgb2gray(imread('segmented_images_02.jpg'));
SEG{3} = rgb2gray(imread('segmented_images_03.jpg'));
%�w�i���ǂ����𔻒聕�摜��2�l��
for ii = 1:3
%     countWhite = 0;
%     countBlack = 0;
%     img = SEG{ii};
%     [x,y] = size(img);
%     for jj = 1:x
%         for kk = 1:y
%             if img(jj,kk) == 255
%                 countWhite = countWhite + 1;
%             end
%             if img(jj,kk) == 0
%                 countBlack = countBlack + 1;
%             end
%         end
%     end
%     if countWhite > countBlack
%         BGFlag(ii) = true;
%     end
    BW{ii} = SEG{ii} > Threshold(SEG{ii});  %2�l��
end

%�e�I�u�W�F�N�g�̓ʕ��2�l�摜�Ƃ��Đ���(�w�i�͏��O)
for ii = 1:3
    %SEG{ii} = SEG{ii}>Threshold(SEG{ii});
    %imshow(SEG{ii}); pause;
    %BW{ii} = SEG{ii} > Threshold(SEG{ii});
    CH{ii} = toConvHull(SEG{ii});
    %figure(ii)
    %imshow(CONV{ii}); %pause;
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

% imshow(SEG{1}); pause;
% imshow(SEG{2}); pause;
% imshow(SEG{3}); pause;



for ii=1:n-1
   for jj=ii+1:n
      OL = logical(CH{ii}.*CH{jj});
      %imshow(OL); pause;
      tmp1 = OL.*BW{ii};
      %imshow(tmp1); pause;
      %(OL.*BW{ii} ~= OL) | (OL == CH{ii})
      %~(isequal(OL.*BW{ii},OL)) | ~(isequal(OL,CH{ii}))
      if ~(isequal(OL.*BW{ii},OL)) && ~(isequal(OL,CH{ii}))
        
      %else
        [CH{ii},CH{jj}] = deal(CH{jj},CH{ii});
        [BW{ii},BW{jj}] = deal(BW{jj},BW{ii});
        [SEG{ii},SEG{jj}] = deal(SEG{jj},SEG{ii});
      end
   end
end

imshow(SEG{1}); pause;
imshow(SEG{2}); pause;
imshow(SEG{3}); pause;

