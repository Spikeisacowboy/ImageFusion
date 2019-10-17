clc
clear
close all
addpath im
addpath func

tic
rgb = im2double(imread('rgb.jpg'));
nir = im2double(imread('nir.jpg'));

[rgb_x, rgb_y] = gradient(rgb);
[nir_x, nir_y] = gradient(nir);

hx = cat(3, rgb_x, nir_x);
hy = cat(3, rgb_y, nir_y);

[gx, gy] = se(rgb_x, rgb_y, hx, hy);
out = reintegration(rgb, gx, gy);

%% ����������
% res = (out-min(out(:)))/(max(out(:))-min(out(:)));
%% ɫ�ʻظ�������
dyn = 2;
for i=1:3
    Max = mean2(out(:,:,i))+dyn*std2(out(:,:,i));
    Min = mean2(out(:,:,i))-dyn*std2(out(:,:,i));
    res(:,:,i) = (out(:,:,i)-Min)/(Max-Min);
end

imshow([rgb nir res])
% imshow([rgb out])
toc