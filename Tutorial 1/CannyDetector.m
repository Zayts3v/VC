% Script para > Design a program to detect edges using Canny Detector

% Pedir a imagem de input. Este código prevê "dumb users"
image_path = input('Give the image name (It is a string, so needs quotation marks or press 1 if you want to use the output from the program smooth filters:\n');

path = strcat('Imagens\',image_path);
format = extractAfter(image_path,'.');

if (strcmp(format,'png'))
    image = imread(path, 'png');
elseif (strcmp(format,'jpg'))
    image = imread(path, 'jpg');
elseif (image_path==1)
    image = imread('smooth_output.jpg', 'jpg');
else
    fprintf('Erro');
    exit();
end

imageGreyScale = rgb2gray(image);

imageGreyScale = im2double(imageGreyScale);
imageGreyScale = imageGreyScale + sqrt(0.01)*randn(size(imageGreyScale));

% Tá mal até aqui. Falo contigo amanhã.
image = imread('Lena_Gaussian_05.png','png');

%[I,I2,I3] = main_CannyDetector(image);
[I,I2,I3] = main_CannyDetector(imageGreyScale);

figure(1), imshow(I);
figure(2), imshow(I2);
figure(3), imshow(I3); 
%imwrite(I,'Lena_edge_canny_filtersize_variance.png');
%imwrite(I2,'Lena_edge_canny_nonmax_filtersize_variance.png');
%imwrite(I3,'Lena_edge_canny_hysteresis_filtersize_variance.png');