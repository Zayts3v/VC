% Script para > Design a program to detect edges using Canny Detector

% Pedir a imagem de input. Este código prevê "dumb users"
image_path = input('Give the image name (It is a string, so needs quotation marks or press 1 if you want to use the output from the program smooth filters:\n');

path = strcat('Imagens\',image_path);
format = extractAfter(image_path,'.');

if (strcmp(format,'png'))
    image = imread(path, 'png');
elseif (strcmp(format,'png'))
    image = imread(path, 'jpg');
elseif (image_path==1)
    image = imread('smooth_output.jpg', 'jpg');
else
    fprintf('Erro');
    exit();
end

% é preciso está parte???
imageGreyScale = rgb2gray(image);

typeOfOperation = input('Select what you want to do:\n    (1) Gaussian Smoothing\n    (2) Gradient\n    (3) Nonmax\n');
if (typeOfOperation==1)
    kernelSize = input('What is the size of your kernel?\n:');

    smoothArg = input('What is the sigma you want?\n:');
    
    imageGreyScale = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg);
elseif (typeOfNoise==2)
    typeOfOperation = "gaussian noise";
    % Ask for the variance
    noiseArg = input('What is the variance desired ?\n:');
else
    fprintf('Error');
    exit;
end

imshow(imageGreyScale);

