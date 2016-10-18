function ARR=contextEst(SEG)
    [m,n] = size(SEG);
    CH = cell(m,n);
    BW = cell(m,n);

    for ii = 1:n
        GRAY = rgb2gray(SEG{ii});
        BW{ii} = GRAY > Threshold(GRAY);  %2’l‰»
        CH{ii} = toConvHull(GRAY);
    end

    for ii=1:n-1
       for jj=ii+1:n
          OL = logical(CH{ii}.*CH{jj});
          if ~(isequal(OL.*BW{ii},OL)) && ~(isequal(OL,CH{ii}))
            [CH{ii},CH{jj}] = deal(CH{jj},CH{ii});
            [BW{ii},BW{jj}] = deal(BW{jj},BW{ii});
            [SEG{ii},SEG{jj}] = deal(SEG{jj},SEG{ii});
          end
       end
    end
    
    ARR = SEG;
end