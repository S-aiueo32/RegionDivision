function y = Threshold(x)
    p1=0;
    p2=0;

    pause('off');
    [counts,binLocation] = imhist(x);
    close;
    pause('on');
    ave = sum(counts)/255;

    for ii = 1:256
        if counts(ii) > ave
            if p1 == 0
                p1 = ii;
            else
                p2 = ii;
            end
        end
    end

    y = uint8((p1+p2)/2);
end