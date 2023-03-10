%L8_6 GrayLevel Dilation and Erosion
clear, clc, close all;

%load image
Img = imread('portrait.jpg');

%choose any column of the image as 1-d sample
originalColumn = Img(100 : 1099, 1000)';

%loop over different structuring elements (i.e., line)
for len = 1 : 3 : 21
    se = strel('line', len, 0);
    dilated_Col = imdilate(originalColumn, se);
    eroded_Col = imerode(originalColumn, se);

    axes('Parent', figure, 'FontSize', 20);
    plot(originalColumn, 'bo'), hold on;
    plot(originalColumn, 'b--');
    plot(dilated_Col, 'r', 'LineWidth', 2);
    plot(eroded_Col, 'g', 'LineWidth', 2);
    title(['Struturing Element length = ', num2str(len)]);

    saveas(gcf, ['1D_Dilation_Erosion_' num2str(len) '.png']);
end %end of for