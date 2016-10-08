%�Z�x�q�X�g�O�������R�̐����J�E���g����֐�

function y = modality(x)

x = rgb2gray(x);
[I,n] = imhist(x);  %�Z�x�q�X�g�O�����̃f�[�^
I = movmean(I,32);  %�q�X�g�O�����̕�����(32�_�ړ�����)
plot(n,I); pause; hold on;

count = 0;  %�J�E���^�ϐ�
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