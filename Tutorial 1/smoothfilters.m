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
typeOfNoise = input('Select the type of noise:\n    (1) Salt-an-pepper\n    (2) Gaussian Noise:\n');
if (typeOfNoise==1)
    typeOfNoise = "salt & pepper";
    % Ask for the % occurrence
    % Falta comtemplar os valores default
    noiseArg = input('What is the percentage of occurrence desired ?\n:');
elseif (typeOfNoise==2)
    typeOfNoise = "gaussian noise";
    % Ask for the variance
    % Falta comtemplar os valores default
    noiseArg = input('What is the variance desired ?\n:');
else
    fprintf('Error');
    exit;
end

% Filtering domain
filteringDomain = input('Select the filtering domain:\n    (1) Spatial domain\n    (2) Frequency domain:\n');

if (filteringDomain==1)
    filteringDomain="spatial";
    % Select the type of smoothing
    typeOfSmoothing = input('Select the type of smoothing:\n    (1) Average\n    (2) Gaussian\n    (3) median filters\n');
    if (typeOfSmoothing==1)
        typeOfSmoothing = "average";
        % Falta comtemplar os valores default
        smoothArg = input('What is the width desired ?\n:');
    elseif (typeOfSmoothing==2)
        typeOfSmoothing = "gaussian";
        % Falta comtemplar os valores default
        smoothArg = input('What is the sigma desired ?\n:');
    elseif (typeOfSmoothing==3)
        typeOfSmoothing = "median";
        % Falta comtemplar os valores default
        smoothArg = input('What is the width desired ?\n:');
    else
        fprintf('Erro');
        exit();
    end
elseif (filteringDomain==2)
    filteringDomain="frequency";
    % Select the type of smoothing
    typeOfSmoothing = input('Select the type of smoothing:\n    (1) Gaussian\n    (2) Butterworth filters\n');
    if (typeOfSmoothing==1)
        typeOfSmoothing = 'gaussian';
        % Falta comtemplar os valores default
        smoothArg = input('What is the sigma desired ?\n:');
    elseif (typeOfSmoothing==2)
        typeOfSmoothing = 'butterworth';
        % Falta comtemplar os valores default
        smoothArg = input('What is the width desired ?\n:');
    else
        fprintf('Erro');
        exit();
    end
else
    fprintf('Erro');
    exit(); 
end

output = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmoothing,smoothArg);
%figure(2),imshow(output);

% Por corrigir ainda
% Filter parameters
if (strcmp(filteringDomain,"spatial"))
    width = input('What is the width of the filter ?\n:');
    standardDeviation = input('What is the standard deviation ?\n:');
else
    filterOrder = input('Type the filter order\n:');
end
