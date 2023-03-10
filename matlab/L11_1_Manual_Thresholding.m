%L11_1 Manual Gray_Level Thresholding
clear, clc, close all;

%load image
Img = imread('male.png');

%define your own threshold value
level = 110; %choose manually
bwImg = Img < level;
blendedImg = Img .* uint8(bwImg);

%show image
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(bwImg), title('Thresholded Image');
subplot(1, 3, 3), imshow(blendedImg), title('Binary Map Original');

%save images
imwrite(bwImg, 'Gray_Level_Thresholded.png');
imwrite(blendedImg, 'Gray_Level_Blended.png');