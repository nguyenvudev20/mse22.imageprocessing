%In-class activity 02b
clear, clc, close all;

%load image
Img = imread('coins.png');

%a. binarize image
level = graythresh(Img);
bwImg = imbinarize(Img, level);
figure, clf;
imshow(bwImg), title('Binarized Image');

%b. choose any structuring element
se = strel('sphere', 2);
Img_dilated = imdilate(Img, se);
Img_eroded = imerode(Img, se);
edge1 = Img_dilated - Img;
edge2 = Img - Img_eroded;
edge3 = edge1 + edge2;
figure, clf;
imshow(edge3), title('Detected Edges');

%c. create your own structuring element
se1 = [0 1 1 0; 1 0 0 1; 1 0 0 1; 0 1 1 0];
Img_dilated = imdilate(Img, se1);
Img_eroded = imerode(Img, se1);
edge1 = Img_dilated - Img;
edge2 = Img - Img_eroded;
edge3 = edge1 + edge2;
figure, clf;
imshow(edge3), title('Detected Edges by Custom SE');