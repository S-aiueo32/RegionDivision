function ARR=contextEst(SEG)

[m,n] = size(SEG);
CH = cell(m,n);
BW = cell(m,n);
BGFlag = logical(zeros(m,n));

for ii = 1:n
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
    BW{ii} = SEG{ii} > Threshold(SEG{ii});  %2’l‰»
end

end