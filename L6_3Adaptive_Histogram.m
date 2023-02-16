%L6_3 Adaptive Histogram Equalization (Local)
clear, clc, close all;

%load image
Img = imread('moon.jpg');

%apply global and local adaptive histogram equalization
eqImg = histeq(Img);
%contrast limited adaptive histogram equalization (clahe)
claheImg1 = adapthisteq(Img, 'NumTiles', [8 8]);
claheImg2 = adapthisteq(Img, 'NumTiles', [16 16]);

%show images
figure;
subplot(2, 2, 1), imshow(Img), title('Original Image');
subplot(2, 2, 2), imshow(eqImg), title('Global Histogram');
subplot(2, 2, 3), imshow(claheImg1), title('Tiling 8*8 Histograms');
subplot(2, 2, 4), imshow(claheImg2), title('Tiling 16*16 Histograms');

%save images
imwrite(eqImg, 'CLAHE_Global.png');
imwrite(claheImg1, 'CLAHE_8by8.png');
imwrite(claheImg2, 'CLAHE_16by16.png');