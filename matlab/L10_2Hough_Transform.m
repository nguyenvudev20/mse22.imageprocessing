%L10_2 Hough Transform for Article
clear, clc, close all;

%load image
Img = imread('article.jpg');

figure(1), clf;
imshow(Img), title('Original Image');

%binarize image
level = graythresh(Img);
bwImg = 1 - im2bw(Img, level);
figure(2), clf;
imshow(bwImg), title('BW_Image.jpg');

%compute Hough Transform
[H, theta, rho] = hough(bwImg, 'Theta', -90 : 0.1 : 89.9, ...
                        'RhoResolution', 1);
figure(3), clf;
imagesc(theta, rho, H);
axis on, axis normal, hold on;
colormap("hot"), colorbar;
xlabel('\theta', 'FontSize', 20);
ylabel('\rho', 'FontSize', 20);
set(gca, 'FontSize', 20);

%detect peaks in Hough Transform
peakNum = 10;
P = houghpeaks(H, peakNum, "Threshold", ceil(0.3*max(H(:))));
lines = houghlines(bwImg, theta, rho, P, ...
                    'FillGap', 3, 'MinLength', 1);
thetaPeaks = theta(P(:,2));
rhoPeaks = rho(P(:,1));
plot(thetaPeaks, rhoPeaks, 'o', 'color', 'R', 'LineWidth', 3);