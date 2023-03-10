%L8_2 Binary Erosion
clear, clc, close all;

%load image
Img = imread('traces.png');

%perform dilation with different structuring element (SE)
%a. Small square with edge = 5
se1 = strel('square', 5);
BW1 = imerode(Img, se1);
%b. Large square with edge = 10
se2 = strel('square', 10);
BW2 = imerode(Img, se2);

%show and save images
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(BW1), title('Erosion by Small Square');
subplot(1, 3, 3), imshow(BW2), title('Erosion by Large Square');
imwrite(BW1, 'Erosion_Square_5.png');
imwrite(BW2, 'Erosion_Square_10.png');