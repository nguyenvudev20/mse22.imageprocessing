%L8_5 Edge Detector using Dilation and Erosion
clear, clc, close all;

%load image
Img = im2double(imread('objects.png'));

%detect edges
se = strel('square', 10); %can change to any struturing element
Img_dilation = imdilate(Img, se);
Img_erosion = imerode(Img, se);
edge1 = Img_dilation - Img;
edge2 = Img - Img_erosion;
edge3 = edge1 + edge2;

%show image
subplot(2, 2, 1), imshow(Img), title('Original Image');
subplot(2, 2, 2), imshow(edge1);
title('Edge_1 = Dilation - Original');
subplot(2, 2, 3), imshow(edge2);
title('Edge_2 = Original - Erosion');
subplot(2, 2, 4), imshow(edge3);
title('Edge_3 = Edge_1 + Edge_2');

%save image
imwrite(edge1, 'Edge_Detection_by_Dilation.png');
imwrite(edge2, 'Edge_Detection_by_Erosion.png');
imwrite(edge3, 'Edge_Detection_by_Combined_Edges.png');