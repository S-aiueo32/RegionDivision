% �Z�O�����e�[�V�����ɂ�蓾��ꂽcell�z��̑O��֌W�𐄒肵�C
% ��w�̃��C������~���ɕ��ёւ���cell�z���ԋp����֐��D
% ���莮�Ƃ��āuA.*Bc=~0����Ac.*B=0�̂Ƃ�A���O���v���g�p�D

function ARR=contextEst_rev(SEG)
    [m,n] = size(SEG);  %����cell�z��̃T�C�Y
    BW = cell(m,n); %2�l�摜���i�[����cell�z��
    CH = cell(m,n); %�ʕ���i�[����cell�z��

    for ii = 1:n
        GRAY = rgb2gray(SEG{ii});   %���͉摜�̃O���[�X�P�[����
        BW{ii} = GRAY > Threshold(GRAY);  %2�l��
        CH{ii} = toConvHull(GRAY); %�ʕ�摜(2�l)�̐���
    end

    [x,y] = size(BW{1});    %�摜�T�C�Y�̎擾
    
    for ii=1:n-1
       for jj=ii+1:n
           %----�C���f�b�N�X���Ⴂ�����O�łȂ���if�����ɓ���D-----%
           subplot(2,1,1); imshow(BW{ii}.*CH{jj});
           subplot(2,1,2); imshow(CH{ii}.*BW{jj});
           if ~(~(isequal(BW{ii}.*CH{jj},zeros(x,y)))&&isequal(CH{ii}.*BW{jj},zeros(x,y)))
             [CH{ii},CH{jj}] = deal(CH{jj},CH{ii});
             [BW{ii},BW{jj}] = deal(BW{jj},BW{ii});
             [SEG{ii},SEG{jj}] = deal(SEG{jj},SEG{ii});
           end
       end
    end
    
    ARR = SEG;
end