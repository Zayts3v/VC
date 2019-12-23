% Script para > Design a program to detect edges using Canny Detector

imagem = input('Select the image:\n    (1) coins\n    (2) coins2\n    (3) coins3\n');

if (imagem==1)
    image = imread('Images\coins.jpg','jpg');
elseif (imagem==2)
    image = imread('Images\coins2.jpg','jpg');
elseif (imagem==3)
	image = imread('Images\coins3.jpg','jpg');
else
    fprintf('Error');
    exit;
end

imageGreyScale = rgb2gray(image);

% Select the type of noise
typeOfNoise = input('Select the type of noise:\n    (1) Salt-an-pepper\n    (2) Gaussian Noise\n');
if (typeOfNoise==1)
    typeOfNoise = "salt & pepper";
    % Ask for the % occurrence
    noiseArg = input('What is the percentage of occurrence desired?\n  Type "-1" for default values\n:');
elseif (typeOfNoise==2)
    typeOfNoise = "gaussian noise";
    % Ask for the variance
    noiseArg = input('What is the variance desired?\n  Type "-1" for default values\n:');
else
    fprintf('Error');
    exit;
end

% Default values for Salt-and-pepper and gaussian noise
if(noiseArg == (-1))
   noiseArg = 0.05;
end

