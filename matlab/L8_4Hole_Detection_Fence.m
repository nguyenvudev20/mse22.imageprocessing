%L8_4 Hole Detection in a Fence
clear, clc, close all;

%load image
Img = imread('fence.jpg');
Img = rgb2gray(Img);
ImgSize = size(Img);
level = graythresh(Img);
BW = im2bw(Img, level);

%perform erosion with a cross struturing element
length = 101;
NHOOD = zeros(length);
NHOOD(ceil(length/2), :) = 1;
NHOOD(:, ceil(length/2)) = 1;
se = strel('arbitrary', NHOOD);
BW1 = imerode(BW, se);

%show and save images
figure(1), clf;
imshow(NHOOD);

figure(2), clf;
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(BW), title('Binary Image');
subplot(1, 3, 3), imshow(BW1), title('Eroded Image');

imwrite(BW, 'Binary_Erosion_Fence_BW.jpg');
imwrite(BW1, 'Binary_Erosion_Fence_Hole_Detection.jpg');