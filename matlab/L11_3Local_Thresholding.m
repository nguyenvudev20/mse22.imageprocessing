%L11_3 Local Adaptive Thresholding
clear, clc, close all;

%load image
%Img = im2double(imread('paper.png'));
Img = rgb2gray(imread('article.png'));

%global thresholding
level = graythresh(Img);
globalbwImg = im2bw(Img, level);

%local thresholding
[row col] = size(Img);
stepSize = 16; tileSize = 32;
varThresh = 0.0005;
localbwImg = zeros(row, col); %initialize a zero matrix
uniformMask = zeros(row, col);
threshIm = zeros(row/stepSize, col/stepSize);
for i = 1 : row/stepSize
    %get indices for row
    rowStep = (i - 1) * stepSize + 1 : i * stepSize;
    rowTile = (i - 1) * stepSize + 1 : (i + 1) * stepSize;
    if i == row/stepSize
        rowTile = (i - 2) * stepSize + 1 : i * stepSize;
    end %end of if

    %determine local Otsu's threshold for every single row
    rowThresh = graythresh(Img(rowTile,:));

    for j = 1 : col/stepSize
        %get indices for col
        colStep = (j - 1) * stepSize + 1 : j * stepSize;
        colTile = (j - 1) * stepSize + 1 : (j + 1) * stepSize;
        if j == col/stepSize
            colTile = (j - 2) * stepSize + 1 : j * stepSize;
        end %end of if

        %determine local variance
        step = Img(rowStep, colStep);
        varStep = var(step(:));

        %determine local Otsu's threshold for every single column
        tile = Img(rowTile, colTile);
        localThresh = graythresh(tile);

        %convert to bw tile based on local Otsu's threshold
        if (varStep > varThresh)
            localbwImg(rowStep, colStep) = im2bw(step, localThresh);
            uniformMask(rowStep, colStep) = ones(stepSize, stepSize);
            threshIm(i,j) = localThresh;
        else %threshold based on local mean
            localMean = mean(tile(:));
            threshIm(i,j) = 0;
            if (localMean > min(rowThresh, level))
                localbwImg(rowStep, colStep) = ones(stepSize, stepSize);
            else
                localbwImg(rowStep, colStep) = zeros(stepSize, stepSize);
            end %end of if local Mean
            uniformMask(rowStep, colStep) = zeros(stepSize, stepSize);
        end %end of if local Otsu
    end %end of for j
end %end of for i

%show images
figure(1), clf;
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(globalbwImg), title('Global Thresholded');
subplot(1, 3, 3), imshow(localbwImg), title('Local Thresholded');

figure(2), clf;
subplot(1, 2, 1), imshow(uniformMask .* Img),
title('Original Image with Uniform Mask');
subplot(1, 2, 2), imshow(threshIm),
title('Local Threshold Value Image');