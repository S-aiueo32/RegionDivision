function y = isBG(x)
    BGFlags = logical(zeros(1,length(x)));
    
    for ii = 1:length(BGFlags)
        countWhite = 0;
        countBlack = 0;
        img = x{1,ii};
        img = rgb2gray(img);
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
            BGFlags(ii) = true;
        end
    end
    
    y = BGFlags;
end