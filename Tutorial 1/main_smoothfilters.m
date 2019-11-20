function output = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmooth, smoothArg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if (typeOfNoise == "salt & pepper")
    x = rand(size(imageGreyScale));
    b = find(x < noiseArg/2);
    imageGreyScale(b) = 0; 
    p = find(x >= noiseArg/2 & x < noiseArg);
    imageGreyScale(p) = 255;
else
    p2 = 0;
    imageGreyScale = im2double(imageGreyScale);
    imageGreyScale = imageGreyScale + sqrt(noiseArg)*randn(size(imageGreyScale)) + p2;
end
figure(1),imshow(imageGreyScale);
if (filteringDomain == "spatial")
    matrix = ones(smoothArg);
    if (typeOfSmooth == "average")
        for i = 1:smoothArg
            for j = 1:smoothArg
                matrix(i,j) = 1/(smoothArg*smoothArg);
            end
        end
        imageGreyScale = conv2(imageGreyScale,matrix);
    elseif (typeOfSmooth == "gaussian")
        imageGreyScale = imgaussfilt(imageGreyScale,smoothArg);
    else
        [p,q] = size(matrix);
        imageGreyScale = medfilt2(imageGreyScale,[p q]);
    end
    
else
end

output = imageGreyScale;
end

