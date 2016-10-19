% セグメンテーションにより得られたcell配列の前後関係を推定し，
% 上層のレイヤから降順に並び替えたcell配列を返却する関数．
% 判定式として「A.*Bc=~0且つAc.*B=0のときAが前方」を使用．

function ARR=contextEst_rev(SEG)
    [m,n] = size(SEG);  %入力cell配列のサイズ
    BW = cell(m,n); %2値画像を格納するcell配列
    CH = cell(m,n); %凸包を格納するcell配列

    for ii = 1:n
        GRAY = rgb2gray(SEG{ii});   %入力画像のグレースケール化
        BW{ii} = GRAY > Threshold(GRAY);  %2値化
        CH{ii} = toConvHull(GRAY); %凸包画像(2値)の生成
    end

    [x,y] = size(BW{1});    %画像サイズの取得
    
    for ii=1:n-1
       for jj=ii+1:n
           %----インデックスが若い方が前でない時if文内に入る．-----%
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