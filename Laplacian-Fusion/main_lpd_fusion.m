clc
clear
close all
addpath func
addpath im

rgb = im2double(imread('rgb.jpg'));
nir = im2double(imread('nir.jpg'));

% ����������
nlev = 5;

% ��ͨ���ں�
for i=1:3
    rgb_pyr = LPD(rgb(:,:,i), nlev);
    nir_pyr = LPD(nir, nlev);
    % �����ںϹ���ѡ��
%     out = (rgb_pyr{nlev}+nir_pyr{nlev})/2;
    out = rgb_pyr{nlev};
    % �²��ںϹ���
    for l = nlev-1 : -1 : 1
        out = nir_pyr{l} + rgb_pyr{l} + ...
        imresize(out,[size(nir_pyr{l},1) size(nir_pyr{l},2)],'bilinear');
    end
    O(:,:,i) = out;
end

imshow([rgb nir O])

