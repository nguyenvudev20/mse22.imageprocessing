%L8_3 Binary Erosion with Coins
clear, clc, close all;

%load image
Img = imread('circles.png');

%perform erosion with square with edge = 30
se1 = strel('square', 30);
BW1 = imerode(Img, se1);
%perform erosion with disk with radius = 30
se2 = strel('disk', 30, 0);
BW2 = imerode(Img, se2);
%perform erosion with rectangle with dimensions = [15 30]
se3 = strel('rectangle', [15 30]);
BW3 = imerode(Img, se3);
%perform erosion with diamond with radius = 30
se4 = strel('diamond', 30);
BW4 = imerode(Img, se4);
%perform erosion with line with length = 30 and degree = 45
se5 = strel('line', 30, 45);
BW5 = imerode(Img, se5);

%show and save images
figure(1), clf;
subplot(2, 3, 1), imshow(Img), title('Original Image');
subplot(2, 3, 2), imshow(BW1), title('Eroded by Square');
subplot(2, 3, 3), imshow(BW2), title('Eroded by Disk');
subplot(2, 3, 4), imshow(BW3), title('Eroded by Rectangle');
subplot(2, 3, 5), imshow(BW4), title('Eroded by Diamond');
subplot(2, 3, 6), imshow(BW5), title('Eroded by Line');

imwrite(BW1, 'Binary_Erosion_Coins_Square.jpg');
imwrite(BW2, 'Binary_Erosion_Coins_Disk.jpg');
imwrite(BW3, 'Binary_Erosion_Coins_Rectangle.jpg');
imwrite(BW4, 'Binary_Erosion_Coins_Diamond.jpg');
imwrite(BW5, 'Binary_Erosion_Coins_Line.jpg');