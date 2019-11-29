% Script para > Design a program to smooth images

% Pedir a imagem de input. Este código não prevê "dumb users".
image_path = input('Give the image name (It is a string, so needs quotation marks):\n');

path = strcat('Imagens\',image_path);
format = extractAfter(image_path,'.');

if (strcmp(format,'png'))
    image = imread(path, 'png');
else
    image = imread(path, 'jpg');
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

% Filtering domain
filteringDomain = input('Select the filtering domain:\n    (1) Spatial domain\n    (2) Frequency domain\n');

if (filteringDomain==1)
    filteringDomain="spatial";
    % Select the type of smoothing
    typeOfSmoothing = input('Select the type of smoothing:\n    (1) Average\n    (2) Gaussian\n    (3) median filters\n');
    if (typeOfSmoothing==1)
        typeOfSmoothing = "average";
        a = input('What is the width desired?\n Type "-1" for default values\n:');
        if (a==(-1))
            a = 3;
        end
        b = 0;
    elseif (typeOfSmoothing==2)
        typeOfSmoothing = "gaussian";
        a = input('What is the sigma desired?\n  Type "-1" for default values\n:');
        if (a==(-1))
            a = 10;
        end
        b = input('What is the size of your kernel?\n  Type "-1" for default values\n:');
        if (b==(-1))
            b = 5;
        end
    elseif (typeOfSmoothing==3)
        typeOfSmoothing = "median";
        a = input('What is the width desired?\n  Type "-1" for default values\n:');
        if (a==(-1))
            a = 3;
        end
        b = 0;
    else
        fprintf('Error');
        exit();
    end
elseif (filteringDomain==2)
    filteringDomain="frequency";
    % Select the type of smoothing
    typeOfSmoothing = input('Select the type of smoothing:\n    (1) Gaussian\n    (2) Butterworth filters\n');
    if (typeOfSmoothing==1)
        typeOfSmoothing = 'Gaussian';
        a = input('What is the sigma desired?\n  Type "-1" for default values\n:');
        if (a==(-1))
            a = 10;
        end
        b = 0;
    elseif (typeOfSmoothing==2)
        typeOfSmoothing = 'butter';
        a = input('What is the filter order desired?\n  Type "-1" for default values\n:');
        if (a==(-1))
            a = 20;
        end
        b = input('What is the cutoff desired?\n  Type "-1" for default values\n:');
        if (b==(-1))
            b = 5;
        end
    else
        fprintf('Error');
        exit();
    end
else
    fprintf('Error');
    exit();
end

[output,output1] = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmoothing,a,b);
figure(1), imshow(output)
figure(2), imshow(output1)
imwrite(output,'Lena_Gaussian_0.10.png');
%imwrite(output1,'Lena_Median_Spacial_3.png');