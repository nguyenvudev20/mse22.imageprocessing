%L11_4 Region Labelling
clear, clc, close all;

%load image
Img = imread('fish.png');

%binarize image
level = graythresh(Img);
bwImg = 1 - im2bw(Img, level);

%label regions in the image
L = bwlabel(bwImg, 8);
rgbLabel = label2rgb(L, 'jet', 'k');

%show images
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(bwImg), title('BW Image');
subplot(1, 3, 3), imshow(rgbLabel), title('Label Regions');

%save images
imwrite(bwImg, 'Region_Labeling_BW.png');
imwrite(rgbLabel, 'Region_Labeling_RGB.png');