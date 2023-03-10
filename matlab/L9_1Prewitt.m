%L9_1 Edge Operators (Prewitt)
clear, clc, close all;

%load image
Img_ori = rgb2gray(imread("car.jpg"));
Img = im2double(Img_ori);

h = fspecial('prewitt');
h = fspecial('sobel');
%apply Prewitt filter in vertical direction
filteredImg1 = imfilter(Img, h', "replicate");
filteredImg1 = abs(filteredImg1);
filteredImg1 = filteredImg1 / max(filteredImg1(:)); %normalize

%apply Prewitt filter in horizontal direction
filteredImg2 = imfilter(Img, h, "replicate");
filteredImg2 = abs(filteredImg2);
filteredImg2 = filteredImg2 / max(filteredImg2(:)); %normalize

%show and save images
figure(1), clf;
subplot(1, 3, 1), imshow(uint8(Img_ori)), title('Original Image');
subplot(1, 3, 2), imshow(filteredImg1);
title('Prewitt Vertical');
subplot(1, 3, 3), imshow(filteredImg2);
title('Prewitt Horizontal');
imwrite(filteredImg1, 'Prewitt_car_vertical.jpg');
imwrite(filteredImg2, 'Prewitt_car_horizontal.jpg');