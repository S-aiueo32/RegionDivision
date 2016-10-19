%�ʕ�ɂ���ʑ̂̑O��֌W���� Main�v���O����

clear; close all;

name = 'img01.jpg';
obj = 3;
ORG = imread(name);

subplot()

SEG = segImg(ORG,obj);
ARR = contextEst_rev(SEG);


%mkdir(['images/',name]);
figure;
for ii = 1:obj
    subplot(obj,2,ii*2-1);
    imshow(SEG{ii});    title(['���ёւ��O(',num2str(ii),')']);
    subplot(obj,2,ii*2);
    imshow(ARR{ii});    title(['���ёւ���(',num2str(ii),')']);
    %imwrite(SEG{ii},['images/',name,'/segmented_',num2str(ii),'.jpg']);
    %imwrite(ARR{ii},['images/',name,'/layer_',num2str(ii),'.jpg']);
end

figsz = get(gcf,'Position');
annotation(gcf,'textbox','String','�ʕ�ɂ��O�㐄�茋��',...
            'HorizontalAlignment','center','FontSize',15, ...
                'EdgeColor','none', 'Position',...
                    [0 1-20/figsz(4) 1 20/figsz(4)], ...
                        'FitHeightToText', 'on');
saveas(gcf,['images/',name,'/result.jpg']);