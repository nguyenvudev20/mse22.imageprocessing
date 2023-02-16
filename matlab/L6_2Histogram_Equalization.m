%L6_2 Histogram Equalization (Global)
clear, clc, close all;

%load image
Img = imread('bay.jpg');

%perform histogram equalization
eqImg = histeq(Img);

%show images
figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image');
subplot(1, 2, 2), imshow(eqImg), title('Image After Equalization');
imwrite(eqImg, 'Histogram_Equalization_Image.png');

figure(2), clf;
%show histograms of two images
[counts, index] = imhist(Img);
subplot(1, 2, 1), bar(index, counts);
xlim([0 255]); set(gca, 'FontSize', 20);
xlabel('Gray Level'), ylabel('# of pixels');
title('Histogram of Original Image');

[counts, index] = imhist(eqImg);
subplot(1, 2, 2), bar(index, counts);
xlim([0 255]); set(gca, 'FontSize', 20);
xlabel('Gray Level'), ylabel('# of pixels');
title('Histogram of Equalized Image');