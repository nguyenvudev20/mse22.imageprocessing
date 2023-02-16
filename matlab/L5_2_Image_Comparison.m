%L5_2 Image Comparison
clear, clc, close all;

%load test images
maskImg1 = im2double(imread('mask1.png'));
maskImg2 = im2double(imread('mask2.png'));

%perform image subtraction and comparison
diffImg = abs(maskImg1 - maskImg2);
imshow(diffImg, []), title('Difference Image');
imwrite(diffImg, 'Mask_Compasion_diff.png');
