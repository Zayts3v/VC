% Script para > Design a program to detect edges using Canny Detector

image = imread('Lena_Gaussian_0-025.png','png');

[I,I2,I3] = main_CannyDetector(image);

figure(1), imshow(I);
figure(2), imshow(I2);
figure(3), imshow(I3); 
imwrite(I,'Lena_edge_canny_5_2.png');
imwrite(I2,'Lena_edge_canny_nonmax_5_2.png');
imwrite(I3,'Lena_edge_canny_hysteresis_5_2.png');