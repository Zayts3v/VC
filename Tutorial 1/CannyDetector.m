% Script para > Design a program to detect edges using Canny Detector

image = imread('Lena_Gaussian_05.png','png');

[I,I2,I3] = main_CannyDetector(image);


figure(1), imshow(I);
figure(2), imshow(I2);
figure(3), imshow(I3); 
%imwrite(I,'Lena_edge_canny_filtersize_variance.png');
%imwrite(I2,'Lena_edge_canny_nonmax_filtersize_variance.png');
%imwrite(I3,'Lena_edge_canny_hysteresis_filtersize_variance.png');