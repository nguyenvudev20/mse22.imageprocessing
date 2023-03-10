%L8_1 Binary Dilation
clear, clc, close all;

%load image
Img = imread('traces.png');

%perform dilation with different structuring element (SE)
%a. Small disk with radius = 10
se1 = strel('disk', 10, 0);
BW1 = imdilate(Img, se1);
%b. Large disk with radius = 25
se2 = strel('disk', 25, 0);
BW2 = imdilate(Img, se2);

%show and save images
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(BW1), title('Dilation by Small Disk');
subplot(1, 3, 3), imshow(BW2), title('Dilation by Large Disk');
imwrite(BW1, 'Dilation_Disk_10.png');
imwrite(BW2, 'Dilation_Disk_25.png');