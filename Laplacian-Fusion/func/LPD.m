function pyr = LPD(I, nlev, sigma)
%Laplacian Pyramid Decomposition
%������˹�������ֽ�
%   nlev  ����������
%   sigma ��˹ģ���̶�

if size(I,3)==3
    I=rgb2gray(I);
end

if ~exist('nlev', 'var')
    nlev = 4;
end
 
if ~exist('sigma', 'var')
    sigma=0.4;
end

f = fspecial('gaussian', floor(sigma*6+1), sigma);
 
%����������˹������
pyr = cell(nlev,1);
J = I;
for l = 1:nlev-1   
    J_gauss = imfilter(J,f,'replicate');
    J_gauss_down = J_gauss(1:2:size(J_gauss,1)-1,1:2:size(J_gauss,2)-1); %downsample 
    J_gauss_high = imresize(J_gauss_down,[size(J_gauss,1) size(J_gauss,2)],'bilinear');
    pyr{l} = J-J_gauss_high;
    J=J_gauss_down;
end
pyr{nlev}=J_gauss_down; %����һ�㼴Ϊ��˹������

end

