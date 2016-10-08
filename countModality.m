%濃度ヒストグラムが山の数をカウントする関数

function y = modality(x)

x = rgb2gray(x);
[I,n] = imhist(x);  %濃度ヒストグラムのデータ
I = movmean(I,32);  %ヒストグラムの平滑化(32点移動平均)
plot(n,I); pause; hold on;

count = 0;  %カウンタ変数
for i = 3:size(n);
    dif1 = I(i-1)-I(i-2);
    dif2 = I(i)-I(i-1);
    if dif1>0 && dif2<0
        count = count + 1;
        plot(i-2,I(i-2),'ro')
    end
end
pause;
%clf;
y=uint8(count);

end