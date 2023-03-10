%L11_2 Global Gray_Level Thresholding
clear, clc, close all;

%load image
%Img = imread('male.png');
%Img = imread('brain.jpg');
Img = rgb2gray(imread('article.png'));

%global thresholding by Otsu method
level = graythresh(Img); %choose Otsu threshold
bwImg = im2bw(Img, level);

%show image
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(bwImg), title('Globally Thresholded');
subplot(1, 3, 3), imshow((1 - bwImg) .* im2double(Img)),
title('Overlay Image');
axes('Parent', figure, 'FontSize', 15);

%show histogram of image and threshold value
[counts, x] = imhist(Img);
bar(x, counts), hold on;
OtsuThresh = round(level * 255);
h = plot(OtsuThresh * ones(1, 100), linspace(0, max(counts)), 'g-');
axis([0 255 0 max(counts)]);
set(gca, 'FontSize', 15), set(gcf, 'Color', 'white');

%save images
imwrite(bwImg, 'Global_Thresholding_Binary.png');
saveas(gcf, 'Global_Thresholding_Histogram.png');