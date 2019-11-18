% Script para > Design a program to detect edges using Canny Detector

% Pedir a imagem de input. Este código não prevê "dumb users".
image_path = input('Give the image name (It is a string, so needs quotation marks):\n');

path = strcat('Imagens\',image_path);
format = extractAfter(image_path,'.');

if (strcmp(format,'png'))
    image = imread(path, 'png');
else
    image = imread(path, 'jpg');
end

image_greyScale = rgb2gray(image);

% Select the type of noise
typeOfNoise = input('Select the type of noise:\n    (1) Salt-an-pepper\n    (2) Gaussian Noise:\n');
if (typeOfNoise==1)
    typeOfNoise = "salt-an-pepper";
    % Ask for the % occurrence
    occurrence = input('What is the percentage of occurrence desired ?\n:');
else 
    typeOfNoise = "gaussian noise";
    % Ask for the variance
    variance = input('What is the variance desired ?\n:');
end

% Select the type of smoothing
typeOfSmoothing = input('Select the type of smoothing:\n    (1) Average\n    (2) Gaussian and median filters\n    (3) Gaussian and Butterworth filters:\n');

% Filtering domain
filteringDomain = input('Select the filtering domain:\n    (1) Spatial domain\n    (2) Frequency domain:\n');

if (filteringDomain==1)
    filteringDomain="spatial";
else
    filteringDomain="frequency";
end

% Filter parameters
if (strcmp(filteringDomain,"spatial"))
    width = input('What is the width of the filter ?\n:');
    standardDeviation = input('What is the standard deviation ?\n:');
else
    filterOrder = input('Type the filter order\n:');
end
