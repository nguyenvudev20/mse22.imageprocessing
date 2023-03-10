%L10_3 Hough Transform for Coins
clear, clc, close all;

%load image
Img = imread('coins.png');

figure(1), clf, imshow(Img), title('Original Image');

%extract edges
bw = edge(Img, 'sobel', 0.15);
figure(2), imshow(bw), title('Edge Detection by Sobel');

%find edges with Hough Transform
[centers, radii, metric] = imfindcircles(bw, [50 200], ...
                            'Sensitivity', 0.9);
figure(3), clf;
imshow(Img), hold on;
plot(centers(:, 1), centers(:,2), 'xb', 'MarkerSize', 15, ...
                            'LineWidth', 4);
viscircles(centers, radii, 'EdgeColor', 'r', 'LineWidth', 3);