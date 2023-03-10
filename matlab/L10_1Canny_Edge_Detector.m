%L10_1 Canny Edge Detector
clear, clc, close all;

%load image
%Img = rgb2gray(imread('portrait_female.jpg'));
Img = imread('bike.png');

%loop over some different standard deviation of Gaussian
sigmaArray = [sqrt(2)   sqrt(16)   sqrt(32)];
threshold = 0.15;

figure(1), clf;
subplot(2, 2, 1), imshow(Img), title('Original Image');
for i = 1 : numel(sigmaArray)
    %compute and display Canny edges
    sigma = sigmaArray(i);
    bw = edge(Img, "canny", threshold, sigma);
    subplot(2, 2, i + 1), imshow(bw);
    title(sprintf('sigma = %.2f', sigma));
    imwrite(bw, ['Canny_Edge_' num2str(sigma), '.jpg']);
end %end of for