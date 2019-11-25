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

noiseArg = input('What is the omega you want for gaussian noise?\n:');

imageGreyScale = im2double(imageGreyScale);
imageGreyScale = imageGreyScale + sqrt(noiseArg)*randn(size(imageGreyScale));

typeOfOperation = input('Select what you want to do:\n    (1) Gaussian Smoothing\n    (2) Gradient, Nonmax and Threshold\n');
if (typeOfOperation==1)
    kernelSize = input('What is the size of your kernel?\n:');

    smoothArg = input('What is the sigma you want?\n:');
    
    imageGreyScale = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg);
elseif (typeOfOperation==2)
    % Ask for the variance
    noiseArg = input('What is the variance desired ?\n:');
    
    [Gx,Gy,Gmag,Gdir] = gradient(imageGreyScale);
    
    imageGreyScale = nonmax(imageGreyScale,Gx,Gy,Gmag);
    
    T1 = input('What is the first value for threshold?\n:');
    T2 = input('What is the secound value for threshold?\n:');
    
    imageGreyScale = double_threshold(imageGreyScale,T1,T2);
    
    % Hysteresis Thresholding
else
    fprintf('Error');
    exit;
end

