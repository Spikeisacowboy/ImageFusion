function out = saliency(i1,i2)
%Ȩ��ӳ��
%�������������RGBͼ,����ͼ1����ͨ��Ȩ��ͼ
[w, h, d] = size(i1);
out = zeros(w, h, d);
for i=1:d
    maxmap = max(cat(3, i1(:,:,i), i2(:,:,i)), [], 3); %������ֵͼ
    temp = double(maxmap==i1(:,:,i)); % ���Ȩ��ͼ
    out(:,:,i) = temp;
end

