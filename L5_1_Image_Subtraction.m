%L5_1 Image Subtraction
clear, clc, close all;

%load test images
liveImg = im2double(imread('live.jpg'));
maskImg = im2double(imread('mask.jpg'));

%calculate the difference between two images
diffImg = abs(maskImg - liveImg);
gamma = 0.5;
diffImg_contrasted = diffImg .^ gamma;

%show images
subplot(2, 2, 1), imshow(liveImg), title('Original Image');
subplot(2, 2, 2), imshow(maskImg), title('Mask Image');
subplot(2, 2, 3), imshow(diffImg), title('Difference Image');
subplot(2, 2, 4), imshow(diffImg_contrasted), title('Difference Image increased contrast');

%save images
imwrite(diffImg, 'Image_Subtraction.jpg');
imwrite(diffImg_contrasted, 'Image_Subtraction_with_contrast.jpg');
