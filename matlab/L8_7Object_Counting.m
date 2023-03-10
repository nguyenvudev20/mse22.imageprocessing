%L8_7 Object Counting
clear, clc, close all;

%load image
Img = imread('coins.png');

%Counting on original image
figure(1), clf;
subplot(1, 3, 1), imshow(Img), title('Original Image');
%binarize the original image
level = graythresh(Img);
bwImg1 = 1 - im2bw(Img, level); %im2bw (object = black, bg = white)
subplot(1, 3, 2), imshow(bwImg1), title('Binarized Image');
%region labelling
[L, obj] = bwlabel(bwImg1, 8);
rgbLabel1 = label2rgb(L, 'jet', 'k');
disp('Number of objects:'), disp(obj);
subplot(1, 3, 3), imshow(rgbLabel1), title('Labeled Regions');

%Counting on processed (dilation) image
se = strel('disk', 25, 0);
dilatedImg = imdilate(Img, se);

figure(2), clf;
subplot(1, 3, 1), imshow(Img), title('Original Image');
%binarize the original image
level = graythresh(dilatedImg);
bwImg2 = 1 - im2bw(dilatedImg, level); %im2bw (object = black, bg = white)
subplot(1, 3, 2), imshow(bwImg2), title('Binarized Image');
%region labelling
[L, obj] = bwlabel(bwImg2, 8);
rgbLabel2 = label2rgb(L, 'jet', 'k');
disp('Number of objects:'), disp(obj);
subplot(1, 3, 3), imshow(rgbLabel2), title('Labeled Regions');